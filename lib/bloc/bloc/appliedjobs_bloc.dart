import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'appliedjobs_event.dart';
part 'appliedjobs_state.dart';

class AppliedjobsBloc extends Bloc<AppliedjobsEvent, AppliedjobsState> {
  AppliedjobsBloc() : super(AppliedjobsInitialState());

  @override
  Stream<AppliedjobsState> mapEventToState(AppliedjobsEvent event) async* {
    if (event is GetAppliedJobsEvent) {
      yield AppliedjobsLoadingState();
    }
  }
}
