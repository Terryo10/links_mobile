import 'package:links_app/models/experties_model/expertise_model.dart';
import 'package:links_app/repositories/expertise_repository/experties_provider.dart';

class ExpertiseRepository{
  final ExpertiseProvider provider;

  ExpertiseRepository({required this.provider});

  Future<ExpertiseListModel> getExpertiesList()async{
    var data =await provider.getExpertiesList();
    var model = expertiseListModelFromJson(data);
    return model;
  }

}