import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fourcast/Components/RoundedButton.dart';
import 'package:fourcast/LoginScreen.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:fourcast/ResultScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Components/TextFieldInput.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  String cityName;
  final _auth = FirebaseAuth.instance;
  User  loggedinUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getLocationData () async {

    // String cityName = await value;
    String apiKey = '409b0ec5bf7d88552d8587869911d1e0';

    try {
      http.Response response = await http.get('http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
      if (response.statusCode == 200) {
        String data = response.body;

        var city = jsonDecode(data)['name'];
        var temp = jsonDecode(data)['main']['temp'];
        var weather = jsonDecode(data)['weather'][0]['id'];
        var locationTime = jsonDecode(data)['dt'];
        var humidity = jsonDecode(data)['main']['humidity'];
        var wind = jsonDecode(data)['wind']['speed'];
        var date = DateTime.fromMillisecondsSinceEpoch(locationTime * 1000);
        var time = DateFormat.jm().format(date);
        var weekDay = DateFormat.yMMMMEEEEd().format(date);
        wind.toString();
        humidity.toString();

        print("city" + city);
        print(temp);
        print(weather);
        print(date);
        print(time);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ResultScreen(locationWeather: weather, locationName: city, locationTemp: temp, locationTime: time, locationWeekDay: weekDay, locationHumidity: humidity, locationWind: wind,);
        }));

      } else {
        print(response.statusCode);
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
  }

  void getCurrentUser() async{
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
        print(loggedinUser.email);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/login.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
            ),
            ClipRect(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 70,),
                        TextInputField(
                          hint: '  Search a City',
                          icon: Icons.search,
                          obsecureText: false,
                          inputType: TextInputType.name,
                          inputAction: TextInputAction.search,
                          onSubmit: (value) async {
                            cityName = await value;
                          },
                        ),
                        SizedBox(height: 30,),
                        Center(
                          child: RoundedButton(
                              buttonName: 'Search',
                              onPressed: () {
                                getLocationData();
                              }
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 200,),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 40),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white30,
                              )
                          ),
                        ),
                        RoundedButton(
                            buttonName: 'Sign Out',
                            onPressed: () {
                              _auth.signOut();
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }));
                            }
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
