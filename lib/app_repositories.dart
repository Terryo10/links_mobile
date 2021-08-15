import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:links_app/repositories/authentication_repository/authentication_repository.dart';
import 'package:links_app/repositories/cache_repository/cache_repository.dart';

class AppRespositories extends StatelessWidget {
  final Widget appBlocs;
  final FlutterSecureStorage storage;
  const AppRespositories({required this.appBlocs, required this.storage}) : super();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(create: (context) => AuthenticationRepository(),),
      RepositoryProvider(create: (context)=>CacheRepository(storage: storage))

    ], child: appBlocs);
  }
}
