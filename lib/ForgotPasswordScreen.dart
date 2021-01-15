import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fourcast/Components/BackgroundImage.dart';
import 'package:fourcast/Components/TextFieldInput.dart';
import 'package:fourcast/Components/RoundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        BackgroundImage(backgroundImage: 'assets/images/login.jpg',),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Forgot Password',
              style: GoogleFonts.josefinSans(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
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
          body: Column(
            children: [
              Flexible(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: size.width * 0.8,
                          child: Text(
                            'Enter your email and we will send instructions to reset password',
                            style: GoogleFonts.josefinSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextInputField(
                          icon: FontAwesomeIcons.envelope,
                          hint: 'Email',
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.emailAddress,
                          obsecureText: false,
                          onSubmit: (value) {
                            String email = value;
                            FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        RoundedButton(
                          buttonName: 'Reset Password',
                          onPressed: () {
                            try {
                              Navigator.pushNamed(context, '/LoginScreen');
                              Alert(
                                context: context,
                                type: AlertType.info,
                                title: "Alart",
                                desc: "Password reset link sent to email",
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
                            } catch (e) {
                            }
                        },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
        )
      ],
    );
  }
}
