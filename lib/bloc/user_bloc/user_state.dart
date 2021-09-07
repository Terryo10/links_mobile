part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadingState extends UserState{

}


class UserLoadedState extends UserState{ 
  final UserModel userModel;
  final AppliedJobsModel  appliedJobsModel;

  UserLoadedState({required this.userModel, required this.appliedJobsModel});
}

class UserErrorState extends UserState{
final String message;

  UserErrorState({required this.message});
}



