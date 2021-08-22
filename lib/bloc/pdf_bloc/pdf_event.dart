part of 'pdf_bloc.dart';

@immutable
abstract class PdfEvent {}

class UploadPDFEvent extends PdfEvent {
  final File pdfFile;

  UploadPDFEvent({required this.pdfFile});
}

class DeletePDF extends PdfEvent {}

class GetUserPdf extends PdfEvent {}
