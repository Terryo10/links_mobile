import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:links_app/bloc/cache_bloc/cache_bloc.dart';
import 'package:links_app/ui/auth/welcome.dart';
import 'package:links_app/ui/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CacheBloc, CacheBlocState>(
      listener: (context, state) {},
      child: Scaffold(
        body: BlocBuilder<CacheBloc, CacheBlocState>(
          builder: (context, state) {
            if (state is CacheNotFoundState) {
              return WelcomePage();
            } else if (state is CacheFoundState) {
              // user is authenticated
              print('found token');
              return HomePage();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
