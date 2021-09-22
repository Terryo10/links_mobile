import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:links_app/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:links_app/bloc/cache_bloc/cache_bloc.dart';
import 'package:links_app/ui/settings/change_password.dart';

import 'package:links_app/ui/settings/preview_pdf.dart';
import 'package:links_app/ui/update_expertise.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xfff7892b),
      ),
      body: SingleChildScrollView(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                        Expanded(flex: 1, child: Icon(Icons.navigate_next)),
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
                                token: state.authenticationModel.token),
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
                                        'Preview/Change Cv',
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
                                PdfPreviewPage(token: state.token),
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
                                        'Preview/Change Cv',
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                        Expanded(flex: 1, child: Icon(Icons.navigate_next)),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                        Expanded(flex: 1, child: Icon(Icons.navigate_next)),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                        Expanded(flex: 1, child: Icon(Icons.navigate_next)),
                      ],
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
