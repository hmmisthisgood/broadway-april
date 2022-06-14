import 'package:bloc_app/bloc/video_states.dart';
import 'package:bloc_app/screen/stream_screen.dart';
import 'package:bloc_app/utils/assets.dart';
import 'package:bloc_app/widget/photos_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../bloc/video_cubit.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key, this.envMode}) : super(key: key);
  final envMode;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // final videoCubit1 = VideoCubit();
  // final videoCubit2 = VideoCubit();
  String userName = "";

  ValueNotifier<String> user = ValueNotifier("");

  @override
  void initState() {
    super.initState();
    // final videoCubit = BlocProvider.of<VideoCubit>(context);

    // BlocProvider.of<VideoCubit>(context).fetchVideos();
    context.read<VideoCubit>().fetchVideos();
    // videoCubit2.fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context);
    print("build");
    return Scaffold(
        appBar: AppBar(
            title: ValueListenableBuilder<String>(
          valueListenable: user,
          child: Text("User: "),
          builder: (context, value, child) {
            return Row(
              children: [
                if (child != null) child,
                Text(value),
              ],
            );
          },
        )

            // Text(user.value),
            ),
        body: BlocConsumer<VideoCubit, VideoState>(
          // bloc: videoCubit1,
          listener: (context, state) {
            if (state is VideoFetchError) {
              Fluttertoast.showToast(
                msg: "An error occurred.", toastLength: Toast.LENGTH_LONG,
                // textColor: Colors.red,
              );
            }

            if (state is VideoLoadMoreError) {
              Fluttertoast.showToast(
                msg: state.errorMessage, toastLength: Toast.LENGTH_LONG,
                // textColor: Colors.red,
              );
            }
          },
          builder: (context, state) {
            print(state);
            if (state is VideoInitState) {
              return CircularProgressIndicator();
            }
            if (state is VideoLoading) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(state.loadingMessage ?? "loading....")
                ],
              ));
            }
            if (state is VideoFetchError) {
              return Text(state.errorMessage);
            }
            if (state is VideoFetchSuccess ||
                state is LoadMoreVideosState ||
                state is VideoLoadMoreError) {
              return Column(
                children: [
                  Expanded(
                      child: PhontosListView(data: state.data, user: user)),
                  if (state is LoadMoreVideosState) CircularProgressIndicator()
                ],
              );
            }

            // if (state is LoadMoreVideosState) {
            //   return Column(
            //     children: [
            //       Expanded(
            //           child: PhontosListView(data: state.data, user: user)),
            //       CircularProgressIndicator()
            //     ],
            //   );

            // }
            return Text("unknown state");
          },
        ));
  }
}

// BlocBuilder 
// BlocListener
// BlocConsumer (combined form of builder and listener)
// BlocProvider