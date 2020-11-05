import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class ForecastScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              title: Text('Weather Forecast'),
            leading: IconButton(
              icon: Icon(
                  Icons.arrow_back_ios,
              ),
              iconSize: 20.0,
              onPressed: () {
                Navigator.pop(context);
              } ,
            ),
            centerTitle: true,
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
               children: <Widget>[
                 Align(
                   alignment: Alignment.centerLeft,
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Text(
                       'Next 7 Days',
                       style: TextStyle(
                         fontSize: 20.0,
                       ),
                     ),
                   ),
                 ),
                 Card(
                   child: Container(
                     height: MediaQuery.of(context).size.height/10,
                     child: Row(
                       children: <Widget>[
                         BoxedIcon(WeatherIcons.day_sunny),
                         Text('Thursday, 5 Nov'),
                         Text('10'),
                         Text('15'),
                       ],
                     ),
                   ),
                 ),
                 Card(
                   child: Container(
                     height: MediaQuery.of(context).size.height/10,
                     child: Row(
                       children: <Widget>[
                         BoxedIcon(WeatherIcons.day_sunny),
                         Text('Thursday, 5 Nov'),
                         Text('10'),
                         Text('15'),
                       ],
                     ),
                   ),
                 ),
                 Card(
                   child: Container(
                     height: MediaQuery.of(context).size.height/10,
                     child: Row(
                       children: <Widget>[
                         BoxedIcon(WeatherIcons.day_sunny),
                         Text('Thursday, 5 Nov'),
                         Text('10'),
                         Text('15'),
                       ],
                     ),
                   ),
                 ),
                 Card(
                   child: Container(
                     height: MediaQuery.of(context).size.height/10,
                     child: Row(
                       children: <Widget>[
                         BoxedIcon(WeatherIcons.day_sunny),
                         Text('Thursday, 5 Nov'),
                         Text('10'),
                         Text('15'),
                       ],
                     ),
                   ),
                 ),
                 Card(
                   child: Container(
                     height: MediaQuery.of(context).size.height/10,
                     child: Row(
                       children: <Widget>[
                         BoxedIcon(WeatherIcons.day_sunny),
                         Text('Thursday, 5 Nov'),
                         Text('10'),
                         Text('15'),
                       ],
                     ),
                   ),
                 ),
                 Card(
                   child: Container(
                     height: MediaQuery.of(context).size.height/10,
                     child: Row(
                       children: <Widget>[
                         BoxedIcon(WeatherIcons.day_sunny),
                         Text('Thursday, 5 Nov'),
                         Text('10'),
                         Text('15'),
                       ],
                     ),
                   ),
                 ),
                 Card(
                   child: Container(
                     height: MediaQuery.of(context).size.height/10,
                     child: Row(
                       children: <Widget>[
                         BoxedIcon(WeatherIcons.day_sunny),
                         Text('Thursday, 5 Nov'),
                         Text('10'),
                         Text('15'),
                       ],
                     ),
                   ),
                 ),
               ],
            ),
          ),
        ),
      ),
    );
  }
}
