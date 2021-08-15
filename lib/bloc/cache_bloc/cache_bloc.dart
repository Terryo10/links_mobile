import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:links_app/repositories/cache_repository/cache_repository.dart';
import 'package:meta/meta.dart';

part 'cache_bloc_event.dart';
part 'cache_bloc_state.dart';

class CacheBloc extends Bloc<CacheBlocEvent, CacheBlocState> {
  final CacheRepository cacheRepository;
  CacheBloc({required this.cacheRepository}) : super(CacheBlocInitial());

  @override
  Stream<CacheBlocState> mapEventToState(
    CacheBlocEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      //check token availability
      try {
        print('checking token');
        var token = await cacheRepository.getAuthToken();
        yield CacheFoundState(token: token);
      } catch (e) {
        print('user_token not found proceed to login');
        yield CacheNotFoundState();
      }
    }
  }
}
