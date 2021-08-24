import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:links_app/models/user_model/user_model.dart';
import 'package:links_app/repositories/user_repository/user_provider.dart';

class UserRepository {
  final FlutterSecureStorage storage;
  final UserProvider provider;

  UserRepository({required this.storage, required this.provider});

  Future<UserModel> getUserData() async {
    var data = await provider.getUserData();
    var model = userModelFromJson(data);
    return model;
  }
}
