import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:links_app/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:links_app/repositories/authentication_repository/authentication_repository.dart';
import 'package:links_app/repositories/cache_repository/cache_repository.dart';

import 'bloc/cache_bloc/cache_bloc.dart';

class AppBlocs extends StatelessWidget {
  final Widget app;
  final FlutterSecureStorage storage;

  const AppBlocs({required this.app, required this.storage});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CacheBloc(
            cacheRepository: RepositoryProvider.of<CacheRepository>(context),
          )..add(AppStartedEvent()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(
            authenticationRepository:
                RepositoryProvider.of<AuthenticationRepository>(context),
          ),
          lazy: false,
        ),
      ],
      child: app,
    );
  }
}
