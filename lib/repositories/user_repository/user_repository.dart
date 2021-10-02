import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:links_app/models/applied_jobs_model/applied_jobs_model.dart';
import 'package:links_app/models/jobs_model/jobs_model.dart';
import 'package:links_app/models/messsage_model/message.dart';
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

  Future<JobsModel> getAppliedJobs() async {
    var data = await provider.getAppliedJobs();
    var model = jobsModelFromJson(data);
    return model;
  }

  Future<MessageModel> jobApplication({required jobId}) async {
    var data = await provider.jobApplication(jobId: jobId);
    var model = messageModelFromJson(data);
    return model;
  }

  Future<MessageModel> changePassword(
      {required oldPassword, required newPassword}) async {
    var data = await provider.changePassword(
        oldPassword: oldPassword, newPassword: newPassword);
    var model = messageModelFromJson(data);
    return model;
  }
}
