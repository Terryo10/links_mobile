import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:links_app/repositories/authentication_repository/authentication_repository.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
      final AuthenticationRepository authenticationRepository;
  AuthenticationBloc({required this.authenticationRepository}) : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is LoginButtonPressedEvent) {
      yield AuthenticationLoadingState();
    }
  }
}
