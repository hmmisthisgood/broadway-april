import 'package:equatable/equatable.dart';

abstract class VideoState extends Equatable {}

class VideoInitState extends VideoState {
  @override
  List<Object?> get props => [];
}

// loading
class VideoLoading extends VideoState {
  final String? loadingMessage;
  VideoLoading({this.loadingMessage});
  @override
  List<Object?> get props => [];
}

// data fetch succeess

class VideoFetchSuccess extends VideoState {
  final List data;
  VideoFetchSuccess({required this.data});
  @override
  List<Object?> get props => [];
}

// data fetch error
class VideoFetchError extends VideoState {
  final String errorMessage;
  VideoFetchError({required this.errorMessage});
  @override
  List<Object?> get props => [];
}

// data load more state
class VideoLoadMoreSuccess extends VideoState {
  @override
  List<Object?> get props => [];
}

// data load more success
class VideoLoadMoreLoading extends VideoState {
  @override
  List<Object?> get props => [];
}
