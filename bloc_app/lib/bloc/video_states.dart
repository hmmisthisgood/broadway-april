import 'package:equatable/equatable.dart';

abstract class VideoState extends Equatable {
  final List data;

  VideoState({required this.data});
}

class VideoInitState extends VideoState {
  VideoInitState() : super(data: []);

  @override
  List<Object?> get props => [];
}

// loading
class VideoLoading extends VideoState {
  final String? loadingMessage;
  VideoLoading({this.loadingMessage}) : super(data: []);
  @override
  List<Object?> get props => [loadingMessage];
}

// data fetch succeess

class VideoFetchSuccess extends VideoState {
  final List data;
  VideoFetchSuccess({required this.data}) : super(data: data);
  @override
  List<Object?> get props => [...data];
}

// data fetch error
class VideoFetchError extends VideoState {
  final String errorMessage;
  VideoFetchError({required this.errorMessage}) : super(data: []);
  @override
  List<Object?> get props => [...data, errorMessage];
}

class LoadMoreVideosState extends VideoState {
  final List data;

  LoadMoreVideosState({required this.data}) : super(data: data);

  @override
  List<Object?> get props => [...data];
}

class VideoLoadMoreError extends VideoState {
  final String errorMessage;
  final List data;

  VideoLoadMoreError({required this.errorMessage, required this.data})
      : super(data: data);
  @override
  List<Object?> get props => [...data, errorMessage];
}

class VideoRefreshingState extends VideoState {
  final List data;

  VideoRefreshingState({required this.data}) : super(data: data);
  @override
  List<Object?> get props => [...data];
}

class VideoRefreshErrorState extends VideoState {
  final String errorMessage;
  final List data;

  VideoRefreshErrorState({required this.errorMessage, required this.data})
      : super(data: data);
  @override
  List<Object?> get props => [...data, errorMessage];
}
