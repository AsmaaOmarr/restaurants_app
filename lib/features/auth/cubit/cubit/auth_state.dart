part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginFailed extends AuthState {
  final String msg;

  LoginFailed({required this.msg});
}

final class LoginSuccess extends AuthState {
  final String msg;

  LoginSuccess({required this.msg});
}

final class SignUpFailed extends AuthState {
  final String msg;

  SignUpFailed({required this.msg});
}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {
  final String msg;

  SignUpSuccess({required this.msg});
}
