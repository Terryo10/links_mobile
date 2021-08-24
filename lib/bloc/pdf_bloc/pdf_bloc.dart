import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:links_app/bloc/user_bloc/user_bloc.dart';
import 'package:links_app/models/messsage_model/message.dart';
import 'package:links_app/repositories/pdf_repository/pdf_repository.dart';
import 'package:meta/meta.dart';

part 'pdf_event.dart';
part 'pdf_state.dart';

class PdfBloc extends Bloc<PdfEvent, PdfState> {
  final PDFRepository pdfRepository;
  final UserBloc userBloc;
  PdfBloc({required this.pdfRepository, required this.userBloc})
      : super(PdfInitial());

  @override
  Stream<PdfState> mapEventToState(
    PdfEvent event,
  ) async* {
    if (event is UploadPDFEvent) {
      yield PDFUploadingState();
      try {
        print('we are in the bloc posting');
        var response = await pdfRepository.upload(selectedfile: event.pdfFile);
        userBloc.add(GetUserDataEvent());
        yield PDFUploadedState(messageModel: response);
      } catch (e) {
        print(e.toString());
        yield PDFErrorState(e.toString());
      }
    }

    if (event is ResetPdfEvent) {
      yield PdfInitial();
    }
  }
}
