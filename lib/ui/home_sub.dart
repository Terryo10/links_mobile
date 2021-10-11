import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:links_app/bloc/cache_bloc/cache_bloc.dart';
import 'package:links_app/bloc/user_bloc/user_bloc.dart';
import 'package:links_app/ui/experties_page.dart';
import 'package:links_app/ui/job_listing.dart';
import 'package:links_app/ui/settings/settings.dart';
import 'package:links_app/ui/upload_pdf.dart';
import 'package:links_app/ui/widgets/loader.dart';
import 'package:links_app/ui/widgets/logout_popup.dart';

class HomeSub extends StatefulWidget {
  const HomeSub({Key? key}) : super(key: key);

  @override
  _HomeSubState createState() => _HomeSubState();
}

class _HomeSubState extends State<HomeSub> {
  FlutterSecureStorage storage = new FlutterSecureStorage();
  String name = "";
  String email = "";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
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
              bottom: const TabBar(
                tabs: [
                  Tab(text: "All Jobs"),
                  Tab(text: "My WishList"),
                ],
              ),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text('Oflutter.com'),
                    accountEmail: Text('example@gmail.com'),
                    currentAccountPicture: CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                          'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                          fit: BoxFit.cover,
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xfff7892b),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Settings'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsPage(),
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
            body: TabBarView(children: [
              BlocListener<UserBloc, UserState>(
                listener: (context, state) {
                  if (state is UserLoadedState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        // ignore: unnecessary_null_comparison
                        content:
                            Text('Please Upload a photo on your profile ')));
                  }
                },
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserLoadingState) {
                      return Loader();
                    } else if (state is UserLoadedState) {
                      if (state.userModel.data!.expertise == null) {
                        //return expertise first
                        print('hapana expertise');
                        setState(() {
                          name = state.userModel.data!.name!;
                          email = state.userModel.data!.name!;
                        });
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
              Container()
            ])));
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
          onPressed: () {
            BlocProvider.of<CacheBloc>(context).add(AppStartedEvent());
          },
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
