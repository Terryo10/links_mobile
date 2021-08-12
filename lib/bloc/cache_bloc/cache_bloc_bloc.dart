import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cache_bloc_event.dart';
part 'cache_bloc_state.dart';

class CacheBlocBloc extends Bloc<CacheBlocEvent, CacheBlocState> {
  CacheBlocBloc() : super(CacheBlocInitial());

  @override
  Stream<CacheBlocState> mapEventToState(
    CacheBlocEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
