import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:links_app/models/experties_model/expertise_model.dart';
import 'package:links_app/repositories/expertise_repository/experties_repository.dart';
import 'package:meta/meta.dart';

part 'experties_bloc_event.dart';
part 'experties_bloc_state.dart';

class ExpertiesBloc extends Bloc<ExpertiesEvent, ExpertiesBlocState> {
  final ExpertiseRepository expertiseRepository;
  ExpertiesBloc({required this.expertiseRepository})
      : super(ExpertiesBlocInitial());

  @override
  Stream<ExpertiesBlocState> mapEventToState(
    ExpertiesEvent event,
  ) async* {
    if (event is FetchExpertiesList) {
      yield ExpertiseLoadingState();
      try {
        var data = await expertiseRepository.getExpertiesList();
        yield ExpertiseLoadedState(expertiseListModel: data);
      } catch (e) {
        yield ExpertiseErrorState(message: e.toString());
      }
    }
  }
}
