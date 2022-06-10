import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class AuthIntial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  final loadingMessage;
  AuthLoading({required this.loadingMessage});

  @override
  List<Object?> get props => [];
}

class AuthSuccess extends AuthState {
  final user;
  AuthSuccess({required this.user});
  @override
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  final String errorMessage;

  AuthError({required this.errorMessage});

  @override
  List<Object?> get props => [];
}
