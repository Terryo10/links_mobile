import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:links_app/bloc/pdf_bloc/pdf_bloc.dart';

class UploadPdF extends StatefulWidget {
  const UploadPdF({Key? key}) : super(key: key);

  @override
  _UploadPdFState createState() => _UploadPdFState();
}

class _UploadPdFState extends State<UploadPdF> {
  String tit = 'Uploading....';

  String sub = 'Please wait a moment while we upload your files.';

  @override
  Widget build(BuildContext context) {
    return BlocListener<PdfBloc, PdfState>(
      listener: (context, state) {},
      child: BlocBuilder<PdfBloc, PdfState>(
        builder: (context, state) {
          if (state is PDFUploadingState) {
            return uploading();
          } else if (state is PdfInitial) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  onUploadPDF();
                },
                backgroundColor: Colors.amber,
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              backgroundColor: Colors.white,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.width * 0.6,
                    width: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/uploads.jpeg'))),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Text(
                    'Upload',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.5,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Text(
                      'Browse and upload your cv to procceed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            );
          } else if (state is PDFUploadedState) {
            print('pdf was uploaded');
            return uploadSuccess();
          }
          return buildError();
        },
      ),
    );
  }

  void onUploadPDF() async {
    print('uploading pdf');

    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      print('picked a file');
      File file = File(result.files.single.path!);
      BlocProvider.of<PdfBloc>(context).add(UploadPDFEvent(pdfFile: file));
    } else {
      print('user cancelleed picking ');
      // User canceled the picker
    }
  }

  Widget uploading() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width * 0.6,
            width: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/uploads.jpeg'))),
          ),
          SizedBox(
            height: 60.0,
          ),
          Text(
            'Uploading',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40.5,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Text(
              'Please wait while we upload your resume',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.5,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        children: [Text(' Ooops something error wangu')],
      ),
    );
  }

  Widget uploadSuccess() {
    return Center(
      child: Column(
        children: [Text(' Ooops something error wangu')],
      ),
    );
  }
}
