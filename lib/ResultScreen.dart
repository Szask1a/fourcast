import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fourcast/weatherModel.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MenuScreen.dart';

class ResultScreen extends StatefulWidget {

  ResultScreen({this.locationWeather, this.locationName, this.locationTemp, this.locationTime, this.locationWeekDay, this.locationWind, this.locationHumidity});
  final locationWeather;
  final locationName;
  final locationTemp;
  final locationTime;
  final locationWeekDay;
  final locationHumidity;
  final locationWind;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  WeatherModel weatherModel = WeatherModel();
  var city;
  var weatherIcon;
  var weatherMessege;
  var weather;
  var time;
  var weekDay;
  var humidity;
  var wind;
  var temp;

  @override
  void initState() {
    super.initState();
    updateUI(
      widget.locationName,
      widget.locationTemp,
      widget.locationWeather,
      widget.locationTime,
      widget.locationWeekDay,
      widget.locationWind.toString(),
      widget.locationHumidity.toString(),
    );
  }

  void updateUI (
      dynamic locationName,
      dynamic locationTemp,
      dynamic locationWeather,
      dynamic locationTime,
      dynamic locationWeekDay,
      dynamic locationWind,
      dynamic locationHumidty,
      ) {

    setState(() {
      temp = locationTemp;
      var condition = locationWeather;
      print(condition);
      weatherIcon = weatherModel.getWeatherIcon(condition);
      weatherMessege = weatherModel.getMessege(condition);
      weather = weatherModel.getWeather(condition);
      city = locationName;
      time = locationTime;
      weekDay = locationWeekDay;
      humidity = locationHumidty;
      wind = locationWind;
    });
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
        actions: [
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MenuScreen();
                }));
              }
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              '$weatherIcon',
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
                        SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                          child: Text(
                            '$city',
                            style: GoogleFonts.josefinSans(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                          child: Text(
                            '$time - $weekDay',
                            style: GoogleFonts.josefinSans(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 200,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                          child: Text(
                            '$temp \u00b0C',
                            style: GoogleFonts.josefinSans(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                          child: Text(
                            '$weatherMessege',
                            style: GoogleFonts.josefinSans(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                                  child: Text(
                                    'Wind',
                                    style: GoogleFonts.josefinSans(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                                  child: Text(
                                    '$humidity',
                                    style: GoogleFonts.josefinSans(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                                  child: Text(
                                    'km/h',
                                    style: GoogleFonts.josefinSans(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                                  child: Text(
                                    'Humidity',
                                    style: GoogleFonts.josefinSans(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                                  child: Text(
                                    '$wind',
                                    style: GoogleFonts.josefinSans(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                                  child: Text(
                                    '%',
                                    style: GoogleFonts.josefinSans(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
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
