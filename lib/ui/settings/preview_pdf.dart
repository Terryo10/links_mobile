import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:links_app/bloc/authentication_bloc/authentication_bloc.dart';

class PdfPreviewPage extends StatefulWidget {
  final token;
  const PdfPreviewPage({Key? key, required this.token}) : super(key: key);

  @override
  _PdfPreviewPageState createState() => _PdfPreviewPageState();
}

class _PdfPreviewPageState extends State<PdfPreviewPage> {
  FlutterSecureStorage storage = FlutterSecureStorage();
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument(widget.token);
  }

  loadDocument(String token) async {
    print('fired');
    var headers = <String, String>{
      "Authorization": "Bearer $token",
      "content-type": "application/json"
    };
    document = await PDFDocument.fromURL(
        'http://192.168.43.160:5000/storage/cv_file/Godferrerer_1629843086_.pdf',
        headers: headers);

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Cv Preview'), backgroundColor: Color(0xfff7892b)),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your Current ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                Text(
                  'Cv',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )
              ],
            ),
          ),
          Flexible(
              flex: 8,
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : PDFViewer(document: document)),
          Container(
            width: 150,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                color: Color(0xfff7892b),
                child: Text(
                  'Change Cv',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
