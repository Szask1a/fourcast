import 'package:flutter/material.dart';
import 'package:fourcast/SplashScreen.dart';
import 'package:fourcast/Components/BackgroundImage.dart';
import 'package:fourcast/Components/RoundedButton.dart';
import 'package:fourcast/Components/TextFieldInput.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _auth = FirebaseAuth.instance;
  String username;
  String email;
  String password;
  
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        BackgroundImage(backgroundImage: 'assets/images/signin.jpg',),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                    Center(
                      child: CircleAvatar(
                        radius: size.width * 0.14,
                        backgroundColor: Colors.grey[400].withOpacity(0.5),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.user,
                            color: Colors.white,
                            size: size.width * 0.15,
                          ),
                        ),
                      ),
                    ),
                SizedBox(
                  height: 30,
                ),
                TextInputField(
                  icon: FontAwesomeIcons.portrait,
                  hint: 'Name',
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.name,
                  obsecureText: false,
                  onSearch: (value) {
                    username = value;
                  },
                ),
                SizedBox(height: 20,),
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
                SizedBox(height: 20,),
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
                SizedBox(height: 20,),
                SizedBox(
                  height: 25,
                ),
                RoundedButton(
                  buttonName: 'Signup',
                  onPressed: () async {
                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      print(email);
                      print(password);
                      print(username);
                      if (newUser != null) {
                        Alert(
                          context: context,
                          type: AlertType.info,
                          title: "Alart",
                          desc: "User account created",
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
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return SplashScreen();
                            }));
                      }
                    } catch (e) {
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
              ],
            ),
          ),
        )
      ],
    );
  }
}
