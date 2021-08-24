part of 'experties_bloc.dart';

@immutable
abstract class ExpertiesEvent {}

class FetchExpertiesList extends ExpertiesEvent{}

class ResetExpertiesList extends ExpertiesEvent{}

class AssignExpertiesToUser extends ExpertiesEvent{
  final expertiesId;

  AssignExpertiesToUser({required this.expertiesId});
}
