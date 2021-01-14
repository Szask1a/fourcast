import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fourcast/HomeScreen.dart';
import 'package:fourcast/LoginScreen.dart';
import 'package:lottie/lottie.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'SignupScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData () async {
    double longitude;
    double latitude;
    String weekDay;
    String apiKey = '409b0ec5bf7d88552d8587869911d1e0';

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    longitude = position.longitude;
    latitude = position.latitude;

    Response response = await get('http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    if (response.statusCode == 200) {
      String data = response.body;

      var city = await jsonDecode(data)['name'];
      var temp = await jsonDecode(data)['main']['temp'];
      var weather = await jsonDecode(data)['weather'][0]['id'];
      var locationTime = await jsonDecode(data)['dt'];
      var humidity = await jsonDecode(data)['main']['humidity'];
      var wind = await jsonDecode(data)['wind']['speed'];
      var date = DateTime.fromMillisecondsSinceEpoch(locationTime * 1000);
      var time = DateFormat.jm().format(date);
      weekDay = DateFormat.yMMMMEEEEd().format(date);
      wind.toString();
      humidity.toString();

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeScreen(locationWeather: weather, locationName: city, locationTemp: temp, locationTime: time, locationWeekDay: weekDay, locationHumidity: humidity, locationWind: wind,);
      }));
    } else {
      print(response.statusCode);
    }
  }
  
  @override
  Widget build(BuildContext context) {

    // final firebaseUser = context.watch<User>();
    //
    // if (firebaseUser != Null) {
    //   return HomeScreen();
    // } else {
    //   return LoginScreen();
    // }

    return Scaffold(
      backgroundColor: Color(0xFF38C172),
      body: Container(
        height: 400,
        width: 400,
        child: Lottie.asset('assets/lottie/windy.json'),
      ),
    );
  }
}



