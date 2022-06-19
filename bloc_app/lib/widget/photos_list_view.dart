import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../bloc/video_cubit.dart';
import '../screen/stream_screen.dart';
import '../utils/assets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PhontosListView extends StatefulWidget {
  const PhontosListView(
      {Key? key,
      required this.data,
      required this.user,
      required this.refreshController})
      : super(key: key);
  final List data;
  final ValueNotifier<String> user;
  final RefreshController refreshController;

  @override
  State<PhontosListView> createState() => _PhontosListViewState();
}

class _PhontosListViewState extends State<PhontosListView> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {});

    scrollController.addListener(() {
      final position = scrollController.position;

      final offset = scrollController.offset;
      // print(position.pixels);

      final pixels = position.pixels;

      if (pixels <= position.minScrollExtent && position.atEdge) {
        print("I am at top");
      }

      print(position.maxScrollExtent);
      final differenec = position.maxScrollExtent - pixels;

      // if (differenec >= 200) {
      //   BlocProvider.of<VideoCubit>(context).loadMoreVideos();
      // }

      if (pixels >= position.maxScrollExtent && position.atEdge) {
        print("I am at end");
        BlocProvider.of<VideoCubit>(context).loadMoreVideos();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SmartRefresher(
        controller: widget.refreshController,
        onRefresh: () {
          BlocProvider.of<VideoCubit>(context).refreshVideos();
        },
        child: ListView.builder(
            controller: scrollController,
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              final image = widget.data[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Stack(
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
                          child: CachedNetworkImage(
                            placeholder: (context, a) =>
                                Image.asset(Assets.placeholder),
                            imageUrl: image['previewURL'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: InkWell(
                          onTap: () {
                            // userName = image["user"];
                            widget.user.value = image["user"];
                            // setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                imageUrl: image['userImageURL'],
                                placeholder: (context, a) =>
                                    Image.asset(Assets.placeholder),
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
