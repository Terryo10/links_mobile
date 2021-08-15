part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationAuthenticatedState extends AuthenticationState {
  final String token;

  AuthenticationAuthenticatedState({required this.token});
}

class AuthenticationErrorState extends AuthenticationState{
  final String message;

  AuthenticationErrorState({required this.message});

}