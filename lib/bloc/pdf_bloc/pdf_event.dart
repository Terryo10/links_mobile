part of 'pdf_bloc.dart';

@immutable
abstract class PdfEvent {}

class UploadPDF extends PdfEvent{

}

class DeletePDF extends PdfEvent{
  
}

class GetUserPdf extends PdfEvent{
  
}
