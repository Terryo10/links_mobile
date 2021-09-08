import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:links_app/models/messsage_model/message.dart';
import 'package:meta/meta.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordInitial());

  @override
  Stream<ChangePasswordState> mapEventToState(
    ChangePasswordEvent event,
  ) async* {
    if(event is PostNewPassword){
      yield ChangeLoadingState();
      try{
        
      }catch(e){

      }
    }
  }
}
