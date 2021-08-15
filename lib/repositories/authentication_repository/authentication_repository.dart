import 'dart:convert';

import 'package:links_app/models/authentication_model.dart';
import 'package:links_app/repositories/authentication_repository/authentication_provider.dart';

class AuthenticationRepository{
  final AuthenticationProvider provider;

  AuthenticationRepository({required this.provider});

  Future<AuthenticationModel> login({required String password, required String email})async{
    var data =await provider.login(password: password, email: email);
    return authenticationModelFromJson(data);
  }
  
}