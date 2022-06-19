import 'package:equatable/equatable.dart';

abstract class CommonState extends Equatable {}

class LoadingState extends CommonState {
  final String loadingMessage;

  LoadingState({required this.loadingMessage});
  @override
  List<Object?> get props => [loadingMessage];
}

class InitState extends CommonState {
  @override
  List<Object?> get props => [];
}

class DataFetchSuccessList extends CommonState {
  final List data;
  DataFetchSuccessList({required this.data});
  @override
  List<Object?> get props => [...data];
}

class DataFetchError extends CommonState {
  final String errorMessage;
  DataFetchError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class DataLoadingMore extends CommonState {
  final List data;
  DataLoadingMore({required this.data});
  @override
  List<Object?> get props => [...data];
}

class DataLoadingMoreError extends CommonState {
  final List data;
  DataLoadingMoreError({required this.data});
  @override
  List<Object?> get props => [...data];
}

class DataRefreshing extends CommonState {
  final List data;
  DataRefreshing({required this.data});
  @override
  List<Object?> get props => [...data];
}

class DataRefreshError extends CommonState {
  @override
  List<Object?> get props => [];
}
