import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:links_app/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:links_app/bloc/welcome_bloc/welcome_bloc.dart';
import 'package:links_app/ui/auth/sign_up_page.dart';
import 'package:links_app/ui/home_page.dart';
import 'package:links_app/ui/widgets/beizer_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _pass = false;
  bool _mail = false;
  bool _emptyEmail = false;
  bool _emptyPass = false;
  bool _passwordVisible = false;
  bool _hidePassword = true;

  bool _validateEmail() {
    var reg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (reg.hasMatch(usernameController.text)) {
      print('Valid email');
      return true;
    } else if (usernameController.text.isEmpty) {
      return true;
    } else {
      print('inValid email');
      return false;
    }
  }

  bool _validatePassword() {
    if (passwordController.text.length > 5) {
      print('Valid pass');
      return true;
    } else if (passwordController.text.isEmpty) {
      return true;
    } else {
      print('Invalid pass');
      return false;
    }
  }

  void _onLoginButtonPressed() {
    FocusScope.of(context).unfocus();
    if (_validateEmail() &&
        _validatePassword() &&
        (usernameController.text.isNotEmpty &&
            passwordController.text.isNotEmpty)) {
      BlocProvider.of<AuthenticationBloc>(context).add(
        LoginButtonPressedEvent(
            password: passwordController.text, email: usernameController.text),
      );
    } else if (usernameController.text.isEmpty &&
        passwordController.text.isEmpty) {
      setState(() {
        _emptyEmail = true;
        _emptyPass = true;
      });
    } else if (usernameController.text.isEmpty) {
      setState(() {
        _emptyEmail = true;
      });
    } else if (passwordController.text.isEmpty) {
      setState(() {
        _emptyPass = true;
      });
    } else {
      print('we did not expect the error ');
    }
  }

  Widget _passwordField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: passwordController,
            obscureText: _hidePassword,
            decoration: InputDecoration(
                errorText: _pass
                    ? 'Password too short'
                    : _emptyPass
                        ? 'Please Fill Me In '
                        : null,
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                      _hidePassword = !_hidePassword;
                    });
                  },
                )),
            onChanged: (value) {
              _validatePassword();
              setState(() {
                _emptyPass = false;
              });
              if (value.isEmpty) {
                setState(() {
                  _pass = false;
                });
              } else {
                if (_validatePassword() == false) {
                  setState(() {
                    _pass = true;
                  });
                } else {
                  setState(() {
                    _pass = false;
                  });
                }
              }
            },
          )
        ],
      ),
    );
  }

  Widget _emailField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              controller: usernameController,
              keyboardType: TextInputType.emailAddress,
              obscureText: isPassword,
              decoration: InputDecoration(
                  errorText: _mail
                      ? 'Invalid email'
                      : _emptyEmail
                          ? 'Please Fill Me In'
                          : null,
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
              onChanged: (value) {
                _validateEmail();
                setState(() {
                  _emptyEmail = false;
                });
                if (value.isEmpty) {
                  setState(() {
                    _mail = false;
                  });
                } else {
                  if (_validateEmail() == false) {
                    setState(() {
                      _mail = true;
                    });
                  } else {
                    setState(() {
                      _mail = false;
                    });
                  }
                }
              })
        ],
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _emailField("Email"),
        _passwordField("Password", isPassword: true),
      ],
    );
  }

  Widget _submitButton(BuildContext context) {
    return InkWell(
      onTap: () {
        _onLoginButtonPressed();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              // ignore: unnecessary_null_comparison
              content: Text(state.message.replaceAll('Exception', ''))));
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticatedState) {
            print('authenticated ');
            return HomePage();
          }
          return Container(
            height: height,
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: -height * .15,
                    right: -MediaQuery.of(context).size.width * .4,
                    child: BezierContainer()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .2),
                        _title(context),
                        SizedBox(height: 50),
                        _emailPasswordWidget(),
                        SizedBox(height: 20),
                        (state is AuthenticationLoadingState)
                            ? SizedBox(
                                child: CircularProgressIndicator(
                                    color: Color(0xfff7892b)),
                                height: 30.0,
                                width: 30.0,
                              )
                            : _submitButton(context),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.centerRight,
                          child: Text('Forgot Password ?',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(height: height * .055),
                        _createAccountLabel(context),
                      ],
                    ),
                  ),
                ),
                Positioned(top: 40, left: 0, child: _backButton(context)),
              ],
            ),
          );
        },
      ),
    ));
  }
}

Widget _backButton(BuildContext context) {
  return InkWell(
    onTap: () {
      BlocProvider.of<WelcomeBloc>(context).add(WelcomeResetEvent());
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
            child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
          ),
          Text('Back',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
        ],
      ),
    ),
  );
}

Widget _createAccountLabel(BuildContext context) {
  return InkWell(
    onTap: () {
      BlocProvider.of<WelcomeBloc>(context).add(WelcomeRegisterEvent());
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Register',
            style: TextStyle(
                color: Color(0xfff79c4f),
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}

Widget _title(BuildContext context) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
        text: 'L',
        style: GoogleFonts.portLligatSans(
          // ignore: deprecated_member_use
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Color(0xffe46b10),
        ),
        children: [
          TextSpan(
            text: 'ink',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 's',
            style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
          ),
        ]),
  );
}
