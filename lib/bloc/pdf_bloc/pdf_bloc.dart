import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:links_app/models/messsage_model/message.dart';
import 'package:links_app/repositories/pdf_repository/pdf_repository.dart';
import 'package:meta/meta.dart';

part 'pdf_event.dart';
part 'pdf_state.dart';

class PdfBloc extends Bloc<PdfEvent, PdfState> {
  final PDFRepository pdfRepository;
  PdfBloc({required this.pdfRepository}) : super(PdfInitial());

  @override
  Stream<PdfState> mapEventToState(
    PdfEvent event,
  ) async* {
    if (event is UploadPDFEvent) {
      yield PDFUploadingState();
      try {
        print('we are in the bloc posting');
        var response = await pdfRepository.upload(selectedfile: event.pdfFile);
        yield PDFUploadedState(messageModel: response);
      } catch (e) {
        print(e.toString());
        yield PDFErrorState(e.toString());
      }
    }
  }
}
