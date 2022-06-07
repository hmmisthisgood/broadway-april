import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'video_states.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitState());

  fetchVideos() async {
    ///
    ///fetch video from the server
    emit(VideoLoading());

    final url = "https://pixabay.com/api";
    Dio api = Dio();

    try {
      final response = await api.get(url, queryParameters: {
        "key": "24747090-95c20607d87e00f7bea20cb40",
        "q": "cars",
        "image_type": "photo"
      });

      final List hits = response.data["hits"];
      print(hits[0]);
      emit(VideoFetchSuccess(data: hits));
    } catch (e) {
      emit(VideoFetchError(errorMessage: e.toString()));
    }
  }

  videos() {
    // emit loading
    /// fetch from cache
    // return [];
    // emit data from cache

    /// fetch from server
    // emit data from server
  }
}
