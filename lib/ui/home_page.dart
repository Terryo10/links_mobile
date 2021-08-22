import 'package:flutter/material.dart';
import 'package:links_app/ui/upload_pdf.dart';
import 'package:links_app/ui/widgets/logout_popup.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xfff7892b),
          title: Text('Links App'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    _showDialog();
                  },
                  child: Container(
                      height: 50, width: 50, child: Icon(Icons.logout)),
                ),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xfff7892b),
                ),
                child: Center(
                  child: Text('Welcome To Links',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body: UploadPdF(),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    return true;
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return LogoutPopup();
        });
  }
}
