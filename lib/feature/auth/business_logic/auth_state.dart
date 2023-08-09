part of 'auth_cubit.dart';


@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthFailureState extends AuthState {
  final String errorMessage;

  AuthFailureState(this.errorMessage);
}

class SignInWithGoogleLoadingState extends AuthState {}

class SignInWithGoogleSuccessState extends AuthState {}

class SignInWithGoogleFailureState extends AuthState {
  final String errorMessage;

  SignInWithGoogleFailureState(this.errorMessage);
}
