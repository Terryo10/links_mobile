import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:links_app/repositories/authentication_repository/authentication_repository.dart';
import 'package:links_app/repositories/cache_repository/cache_repository.dart';
import 'package:links_app/repositories/expertise_repository/experties_provider.dart';
import 'package:links_app/repositories/expertise_repository/experties_repository.dart';
import 'package:links_app/repositories/pdf_repository/pdf_provider.dart';
import 'package:links_app/repositories/pdf_repository/pdf_repository.dart';
import 'package:links_app/repositories/user_repository/user_provider.dart';
import 'package:links_app/repositories/user_repository/user_repository.dart';

import 'repositories/authentication_repository/authentication_provider.dart';

class AppRespositories extends StatelessWidget {
  final Widget appBlocs;
  final FlutterSecureStorage storage;
  const AppRespositories({required this.appBlocs, required this.storage})
      : super();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(
        create: (context) => AuthenticationRepository(
          provider: AuthenticationProvider(storage: storage),
        ),
      ),
      RepositoryProvider(
        create: (context) => CacheRepository(storage: storage),
      ),
      RepositoryProvider(
        create: (context) => UserRepository(
          storage: storage,
          provider: UserProvider(storage: storage),
        ),
      ),
      RepositoryProvider(
        create: (context) =>
            PDFRepository(storage: storage, provider: PDFProvider()),
      ),
      RepositoryProvider(
        create: (context) => ExpertiseRepository(
          provider: ExpertiseProvider(storage: storage),
        ),
      ),
    ], child: appBlocs);
  }
}
