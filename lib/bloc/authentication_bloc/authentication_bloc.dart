import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:links_app/models/authentication_model.dart';
import 'package:links_app/repositories/authentication_repository/authentication_repository.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  AuthenticationBloc({required this.authenticationRepository})
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
  }
}
