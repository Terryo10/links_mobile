import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pdf_event.dart';
part 'pdf_state.dart';

class PdfBloc extends Bloc<PdfEvent, PdfState> {
  PdfBloc() : super(PdfInitial());

  @override
  Stream<PdfState> mapEventToState(
    PdfEvent event,
  ) async* {
    if (event is UploadPDF){
      
    }
  }
}
