import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:links_app/models/user_model/user_model.dart';
import 'package:links_app/repositories/user_repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is GetUserDataEvent) {
      print('getting user data');
      yield UserLoadingState();
      try {
        var userData = await userRepository.getUserData();
        print('user data found');
        yield UserLoadedState(userModel: userData);
      } catch (e) {
        yield UserErrorState(message: e.toString());
      }
    }
  }
}
