import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_app/services/time.dart';

class ForecastScreen extends StatefulWidget {
  final dailyForecastCondition;
  final minDailyTemp;
  final maxDailyTemp;
  final dailyForecastDate;
  ForecastScreen({this.dailyForecastCondition,this.minDailyTemp,this.maxDailyTemp,this.dailyForecastDate});
  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {

  GetTimeWeather timeWeather = GetTimeWeather();
  var dailyDate = new List();
  var timezoneOffset;
  var timeInEpoch = new List();
  var minTemp = new List();
  var maxTemp = new List();
  var dailyCondition = new List();
  @override
  void initState() {
    super.initState();
    getDailyForecast(
        widget.dailyForecastCondition,
        widget.minDailyTemp,
        widget.maxDailyTemp,
        widget.dailyForecastDate,
    );
  }
  void getDailyForecast(dynamic dailyForecastCondition,dynamic minDailyTemp,dynamic maxDailyTemp,dynamic dailyForecastDate) {
    setState(() {
    minTemp = minDailyTemp;
    maxTemp = maxDailyTemp;
    dailyDate = dailyForecastDate;
    dailyCondition = dailyForecastCondition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
                'Weather Forecast',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              iconSize: 20.0,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 20.0),
                    child: Text(
                      'Next 7 days',
                      style: TextStyle(
                        fontSize: 27.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                ExpandableWeatherTile(
                  initiallyExpanded: true,
                  date: dailyDate[0],
                  minTemp: minTemp[0],
                  maxTemp: maxTemp[0],
                  dailyCondition: dailyCondition[0],
                ),
                TileDivider(),
                ExpandableWeatherTile(
                  initiallyExpanded: false,
                  date: dailyDate[1],
                  minTemp: minTemp[1],
                  maxTemp: maxTemp[1],
                  dailyCondition: dailyCondition[1],
                ),
                TileDivider(),
                ExpandableWeatherTile(
                  initiallyExpanded: false,
                  date: dailyDate[2],
                  minTemp: minTemp[2],
                  maxTemp: maxTemp[2],
                  dailyCondition: dailyCondition[2],
                ),
                TileDivider(),
                ExpandableWeatherTile(
                  initiallyExpanded: false,
                  date: dailyDate[3],
                  minTemp: minTemp[3],
                  maxTemp: maxTemp[3],
                  dailyCondition: dailyCondition[3],
                ),
                TileDivider(),
                ExpandableWeatherTile(
                  initiallyExpanded: false,
                  date: dailyDate[4],
                  minTemp: minTemp[4],
                  maxTemp: maxTemp[4],
                  dailyCondition: dailyCondition[4],
                ),
                TileDivider(),
                ExpandableWeatherTile(
                  initiallyExpanded: false,
                  date: dailyDate[5],
                  minTemp: minTemp[5],
                  maxTemp: maxTemp[5],
                  dailyCondition: dailyCondition[5],
                ),
                TileDivider(),
                ExpandableWeatherTile(
                  initiallyExpanded: false,
                  date: dailyDate[6],
                  minTemp: minTemp[6],
                  maxTemp: maxTemp[6],
                  dailyCondition: dailyCondition[6],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TileDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      height: 1,
      thickness: 0.4,
    );
  }
}

class ExpandableWeatherTile extends StatelessWidget {
  ExpandableWeatherTile({this.date,this.minTemp,this.maxTemp,this.dailyCondition,this.initiallyExpanded});
  final initiallyExpanded;
  final date;
  final minTemp;
  final maxTemp;
  final dailyCondition;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: initiallyExpanded,
      backgroundColor: Colors.grey[100],
      leading: BoxedIcon(
      //  WeatherIcons.day_sunny,
        dailyCondition,
        size: 26.0,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$date',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Text('$minTemp°  /  $maxTemp° C',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Sunrise',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Pressure',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Wind',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('6:50 AM'),
                    SizedBox(height: 10.0),
                    Text('1015 hPa'),
                    SizedBox(height: 10.0),
                    Text('15 km/h'),
                    SizedBox(height: 10.0),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Sunset',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Humidity',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Visibility',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('6:00 PM'),
                    SizedBox(height: 10.0),
                    Text('75 %'),
                    SizedBox(height: 10.0),
                    Text('20 km'),
                    SizedBox(height: 10.0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
