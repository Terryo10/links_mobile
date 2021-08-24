import 'package:links_app/models/experties_model/expertise_model.dart';
import 'package:links_app/models/messsage_model/message.dart';
import 'package:links_app/repositories/expertise_repository/experties_provider.dart';

class ExpertiseRepository {
  final ExpertiseProvider provider;

  ExpertiseRepository({required this.provider});

  Future<ExpertiseListModel> getExpertiesList() async {
    var data = await provider.getExpertiesList();
    var model = expertiseListModelFromJson(data);
    return model;
  }

  Future<MessageModel> selectExperties({required int expertiseId}) async {
    var data = await provider.selectExperties(expertiseId: expertiseId);
    var model = messageModelFromJson(data);
    return model;
  }
}
