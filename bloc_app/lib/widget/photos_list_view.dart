import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../bloc/video_cubit.dart';
import '../screen/stream_screen.dart';
import '../utils/assets.dart';

class PhontosListView extends StatelessWidget {
  const PhontosListView({Key? key, required this.data, required this.user})
      : super(key: key);
  final List data;
  final ValueNotifier<String> user;
  @override
  Widget build(BuildContext context) {
    return LazyLoadScrollView(
      onEndOfPage: () {
        // print("I am at the edn");

        BlocProvider.of<VideoCubit>(context).loadMoreVideos();
      },
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final image = data[index];

            return Stack(
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.c(context).push(route);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => StreamScreen(
                                  envMode: "",
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
                      // userName = image["user"];
                      user.value = image["user"];
                      // setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2)),
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
          }),
    );
  }
}
