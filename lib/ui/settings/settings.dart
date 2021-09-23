import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:links_app/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:links_app/bloc/cache_bloc/cache_bloc.dart';
import 'package:links_app/bloc/user_bloc/user_bloc.dart';
import 'package:links_app/models/user_model/user_model.dart';
import 'package:links_app/ui/experties_page.dart';
import 'package:links_app/ui/settings/change_password.dart';

import 'package:links_app/ui/settings/preview_pdf.dart';
import 'package:links_app/ui/update_expertise.dart';
import 'package:links_app/ui/upload_pdf.dart';
import 'package:links_app/ui/widgets/loader.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
      UserModel user ;
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xfff7892b),
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
              user = state.userModel;
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
              return SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangePassword(),
                            ));
                      },
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(
                            width: 2,
                            color: Color(0xfff7892b),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Change Password',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'CenturyGothicBold',
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 1, child: Icon(Icons.navigate_next)),
                              ],
                            ),
                          ]),
                        ),
                      ),
                    ),
                    BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                        if (state is AuthenticationAuthenticatedState) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PdfPreviewPage(
                                        token: state.authenticationModel.token, userModel: user),
                                  ));
                            },
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                side: BorderSide(
                                  width: 2,
                                  color: Color(0xfff7892b),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Preview/Change Cv',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontFamily:
                                                      'CenturyGothicBold',
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Icon(Icons.navigate_next)),
                                    ],
                                  ),
                                ]),
                              ),
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                    BlocBuilder<CacheBloc, CacheBlocState>(
                      builder: (context, state) {
                        if (state is CacheFoundState) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PdfPreviewPage(token: state.token, userModel: user,),
                                  ));
                            },
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                side: BorderSide(
                                  width: 2,
                                  color: Color(0xfff7892b),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Preview/Change Cv',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontFamily:
                                                      'CenturyGothicBold',
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Icon(Icons.navigate_next)),
                                    ],
                                  ),
                                ]),
                              ),
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        // UodateExpertisePage
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UodateExpertisePage(),
                            ));
                      },
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(
                            width: 2,
                            color: Color(0xfff7892b),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Change Expertise',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'CenturyGothicBold',
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 1, child: Icon(Icons.navigate_next)),
                              ],
                            ),
                          ]),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // UodateExpertisePage
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UodateExpertisePage(),
                            ));
                      },
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(
                            width: 2,
                            color: Color(0xfff7892b),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'My Applied Jobs',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'CenturyGothicBold',
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 1, child: Icon(Icons.navigate_next)),
                              ],
                            ),
                          ]),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // UodateExpertisePage
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UodateExpertisePage(),
                            ));
                      },
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(
                            width: 2,
                            color: Color(0xfff7892b),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Subscription Status',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'CenturyGothicBold',
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 1, child: Icon(Icons.navigate_next)),
                              ],
                            ),
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if (state is UserErrorState) {
              return buildError(
                  message: state.message.replaceAll('Exception', ''));
            }
            return buildError();
          },
        ),
      ),
    );
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
