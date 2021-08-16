import 'package:flutter/material.dart';

class UploadPdF extends StatefulWidget {
  const UploadPdF({ Key? key }) : super(key: key);

  @override
  _UploadPdFState createState() => _UploadPdFState();
}

class _UploadPdFState extends State<UploadPdF> {

    String tit = 'Uploading....';
  String sub = 'Please wait a moment while we upload your files.';
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
                onPressed: () {
                  
                },
                backgroundColor: Colors.amber,
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              )
            ,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
        ));
  }
  
}