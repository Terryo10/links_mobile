import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:links_app/bloc/cache_bloc/cache_bloc.dart';
import 'package:links_app/models/auth_model/authentication_model.dart';
import 'package:links_app/repositories/authentication_repository/authentication_repository.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  final CacheBloc cacheBloc;
  AuthenticationBloc(
      {required this.authenticationRepository, required this.cacheBloc})
      : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is LoginButtonPressedEvent) {
      yield AuthenticationLoadingState();
      try {
        FlutterSecureStorage storage = FlutterSecureStorage();
        var loginResponse = await authenticationRepository.login(
            password: event.password, email: event.email);
        storage.write(key: 'token', value: loginResponse.token);
        yield AuthenticationAuthenticatedState(
            authenticationModel: loginResponse);
      } catch (e) {
        yield AuthenticationErrorState(message: e.toString());
      }
    }

    if (event is AppLogoutEvent) {
      try {
        await authenticationRepository.logout();
        cacheBloc.add(AppStartedEvent());
        yield AuthenticationInitial();
      } catch (e) {
        yield AuthenticationErrorState(message: e.toString());
      }
    }

    if (event is RegistrationButtonPressedEvent){
      print('yesaya reg');
      try{
        FlutterSecureStorage storage = FlutterSecureStorage();
        var loginResponse = await authenticationRepository.register(
            password: event.password, email: event.email, name: event.name);
        storage.write(key: 'token', value: loginResponse.token);
        yield AuthenticationAuthenticatedState(
            authenticationModel: loginResponse);
      } catch (e) {
        yield AuthenticationErrorState(message: e.toString());
      }
    }
  }
}
