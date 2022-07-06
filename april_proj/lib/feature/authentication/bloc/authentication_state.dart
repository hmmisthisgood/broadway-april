import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class FirstTimeAppOpen extends AuthState {}

class AuthUninitialized extends AuthState {}

class AuthSuccess extends AuthState {
  final user;
  AuthSuccess({this.user});
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  final String loadingMessage;

  AuthLoading({required this.loadingMessage});
}

class AuthError extends AuthState {
  final String errorMessage;

  AuthError({required this.errorMessage});
}
