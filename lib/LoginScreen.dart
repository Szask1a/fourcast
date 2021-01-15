import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fourcast/Components/RoundedButton.dart';
import 'package:fourcast/Components/TextFieldInput.dart';
import 'Components/BackgroundImage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'SplashScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(backgroundImage: 'assets/images/login.jpg',),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                  child: Center(
                    child: Text(
                      '4Cast',
                      style: GoogleFonts.josefinSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                      ),
                    ),
                  )
              ),
              TextInputField(
                icon: FontAwesomeIcons.envelope,
                hint: 'Email',
                inputAction: TextInputAction.next,
                inputType: TextInputType.emailAddress,
                obsecureText: false,
                onSearch: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 15,),
              TextInputField(
                icon: FontAwesomeIcons.lock,
                hint: 'Password',
                inputAction: TextInputAction.done,
                inputType: TextInputType.name,
                obsecureText: true,
                onSearch: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(190.0, 0.0, 0.0, 0.0),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/ForgotPasswordScreen'),
                  child: Text(
                    'Forgot Password',
                    style: GoogleFonts.josefinSans(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              RoundedButton(
                buttonName: 'Login',
                onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if (user != null) {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SplashScreen();
                          }));
                    }
                  } catch (e) {
                    print(e);
                    String error = e.toString();
                    Alert(
                      context: context,
                      type: AlertType.error,
                      title: "Error",
                      desc: error,
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Continue",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                  }
                },
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/SignupScreen'),
                  child: Text(
                    'Create New Account',
                    style: GoogleFonts.josefinSans(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        )
      ],
    );
  }
}

