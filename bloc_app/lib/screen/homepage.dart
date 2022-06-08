import 'package:bloc_app/bloc/video_states.dart';
import 'package:bloc_app/screen/stream_screen.dart';
import 'package:bloc_app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
          },
          builder: (context, state) {
            print(state);
            if (state is VideoLoading || state is VideoInitState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is VideoFetchError) {
              return Text(state.errorMessage);
            }
            if (state is VideoFetchSuccess) {
              return ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    final image = state.data[index];

                    return Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.c(context).push(route);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => StreamScreen(
                                          envMode: widget.envMode,
                                        )));
                          },
                          child: Container(
                            child: FadeInImage(
                              placeholder: AssetImage(Assets.placeholder),
                              image: NetworkImage(image['largeImageURL']),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: InkWell(
                            onTap: () {
                              userName = image["user"];
                              user.value = image["user"];
                              // setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  image['userImageURL'],
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  });
            }
            return Text("unknown state");
          },
        ));
  }
}

// BlocBuilder 
// BlocListener
// BlocConsumer (combined form of builder and listener)
// BlocProvider