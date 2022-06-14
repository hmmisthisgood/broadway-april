import 'package:bloc_app/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'video_states.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitState());

  List allItems = [];

  int currntPage = 1;
  fetchVideos() async {
    ///
    ///fetch video from the server
    emit(VideoLoading(loadingMessage: "Loading started....."));
    // emit(VideoLoading(
    //     loadingMessage: "Loading completed and date fetched....."));

    Dio api = Dio();
    allItems.clear();
    try {
      final response = await api.get(Constants.apiUrl, queryParameters: {
        "key": Constants.apiKey,
        "q": "cars",
        "image_type": "photo",
        "page": currntPage,
        "per_page": 5,
      });

      final List hits = response.data["hits"];
      allItems = hits;
      emit(VideoFetchSuccess(data: hits));
    } catch (e) {
      emit(VideoFetchError(errorMessage: e.toString()));
    }
  }

  loadMoreVideos() async {
    emit(LoadMoreVideosState(data: allItems));
    emit(LoadMoreVideosState(data: allItems));

    Dio api = Dio();

    currntPage++;

    try {
      final response = await api.get(Constants.apiUrl, queryParameters: {
        "key": Constants.apiKey,
        "q": "cars",
        "image_type": "photo",
        "page": currntPage,
        "per_page": 5
      });

      final List hits = response.data["hits"];

      allItems.addAll(hits);
      emit(VideoFetchSuccess(data: allItems));
      emit(VideoFetchSuccess(data: allItems));
    } on DioError catch (e) {
      print(e.message);
      emit(VideoLoadMoreError(errorMessage: e.message, data: allItems));
    } catch (e, s) {
      print(e);
      print(s);
      emit(VideoLoadMoreError(errorMessage: e.toString(), data: allItems));
    }
  }

  refreshVideos() {
    // emit a state for refrshing videos

    // for ssucces state you can use : VideoFetchSuccess

    /// for error state carete VideoRefreshErrorState
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
