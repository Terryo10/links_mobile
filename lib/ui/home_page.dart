import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:links_app/bloc/user_bloc/user_bloc.dart';
import 'package:links_app/ui/experties_page.dart';
import 'package:links_app/ui/job_listing.dart';
import 'package:links_app/ui/settings/settings.dart';
import 'package:links_app/ui/upload_pdf.dart';
import 'package:links_app/ui/widgets/loader.dart';
import 'package:links_app/ui/widgets/logout_popup.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterSecureStorage storage = new FlutterSecureStorage();
 

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
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(
                      
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Log Out'),
                onTap: () {
                  Navigator.pop(context);
                  _showDialog();
                },
              ),
            ],
          ),
        ),
        body: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return Loader();
              } else if (state is UserLoadedState) {
                if (state.userModel.data!.expertise == null) {
                  //return expertise first
                  print('hapana expertise');
                  return ExpertiesPage();
                }
                if (state.userModel.data!.expertise != null &&
                    state.userModel.data!.cvFile == null) {
                  print('hapana cv');
                  return UploadPdF();
                }
                return JobsPage();
              } else if (state is UserErrorState) {
                return buildError(
                    message: state.message.replaceAll('Exception', ''));
              }
              return buildError();
            },
          ),
        ),
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

  Widget buildError({String? message}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: RaisedButton(
          color: Color(0xfff7892b), // backgrounds
          textColor: Colors.white, // foreground
          onPressed: () {},
          child: Text('Retry'),
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message ?? ' Oops Something went wrong please retry',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
