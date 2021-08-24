import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:links_app/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:links_app/bloc/experties_bloc/experties_bloc.dart';
import 'package:links_app/bloc/user_bloc/user_bloc.dart';
import 'package:links_app/bloc/welcome_bloc/welcome_bloc.dart';
import 'package:links_app/repositories/authentication_repository/authentication_repository.dart';
import 'package:links_app/repositories/cache_repository/cache_repository.dart';
import 'package:links_app/repositories/expertise_repository/experties_repository.dart';
import 'package:links_app/repositories/pdf_repository/pdf_repository.dart';
import 'package:links_app/repositories/user_repository/user_repository.dart';

import 'bloc/cache_bloc/cache_bloc.dart';
import 'bloc/pdf_bloc/pdf_bloc.dart';

class AppBlocs extends StatelessWidget {
  final Widget app;
  final FlutterSecureStorage storage;

  const AppBlocs({required this.app, required this.storage});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(
              userRepository: RepositoryProvider.of<UserRepository>(context)),
        ),
        BlocProvider(
          create: (context) => ExpertiesBloc(
            expertiseRepository:
                RepositoryProvider.of<ExpertiseRepository>(context),
          ),
        ),
        BlocProvider(
          create: (context) => CacheBloc(
            userBloc: BlocProvider.of<UserBloc>(context),
            cacheRepository: RepositoryProvider.of<CacheRepository>(context),
            expertiesBloc: BlocProvider.of<ExpertiesBloc>(context),
          )..add(AppStartedEvent()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(
            authenticationRepository:
                RepositoryProvider.of<AuthenticationRepository>(context),
            cacheBloc: BlocProvider.of<CacheBloc>(context),
            userBloc: BlocProvider.of<UserBloc>(context),
            expertiesBloc: BlocProvider.of<ExpertiesBloc>(context),
          ),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => PdfBloc(
            pdfRepository: RepositoryProvider.of<PDFRepository>(context),
            userBloc: BlocProvider.of<UserBloc>(context),
          ),
        ),
      ],
      child: app,
    );
  }
}
