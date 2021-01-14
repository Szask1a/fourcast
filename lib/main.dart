import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'SplashScreen.dart';
import 'LoginScreen.dart';
import 'package:fourcast/SignupScreen.dart';
import 'ForgotPasswordScreen.dart';
import 'package:fourcast/ResultScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fourcast/MenuScreen.dart';

main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Fourcast());
}

class Fourcast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Fourcast',
          initialRoute: '/',
          routes: {
            '/': (context) => LoginScreen(),
            '/LoginScreen': (context) => LoginScreen(),
            '/HomeScreen' : (context) => HomeScreen(),
            '/SignupScreen' : (context) => SignupScreen(),
            '/ForgotPasswordScreen' : (context) => ForgotPasswordScreen(),
            '/ResultScreen' : (context) => ResultScreen(),
          },
          debugShowCheckedModeBanner: false,
    );
  }
}


