import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_app/services/time.dart';

class ForecastScreen extends StatefulWidget {
  final dailyForecastCondition;
  final minDailyTemp;
  final maxDailyTemp;
  final minDailyTempinC;
  final maxDailyTempinC;
  final dailyForecastDate;
  final pressure;
  final humidity;
  final wind;
  final forecastdailysunrise;
  final forecastdailysunset;
  final forecastuvi;
  final bool darkThemeEnabled;

  ForecastScreen({
    this.dailyForecastCondition,
    this.minDailyTemp,
    this.maxDailyTemp,
    this.dailyForecastDate,
    this.pressure,
    this.humidity,
    this.wind,
    this.forecastdailysunrise,
    this.forecastdailysunset,
    this.forecastuvi,
    this.minDailyTempinC,
    this.maxDailyTempinC,
    this.darkThemeEnabled,
  });
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
  var minTempinC = new List();
  var maxTempinC = new List();

  var dailyCondition = new List();
  var Pressure = new List();
  var Humidity = new List();
  var Wind = new List();
  var DailyForecastSunrise = new List();
  var DailyForecastSunset = new List();
  var ForecastUvi = new List();
  bool DarkThemeEnabled;

  @override
  void initState() {
    super.initState();
    getDailyForecast(
      widget.dailyForecastCondition,
      widget.minDailyTemp,
      widget.maxDailyTemp,
      widget.dailyForecastDate,
      widget.pressure,
      widget.humidity,
      widget.wind,
      widget.forecastdailysunrise,
      widget.forecastdailysunset,
      widget.forecastuvi,
      widget.minDailyTempinC,
      widget.maxDailyTempinC,
      widget.darkThemeEnabled,
    );
  }

  void getDailyForecast(
      dynamic dailyForecastCondition,
      dynamic minDailyTemp,
      dynamic maxDailyTemp,
      dynamic dailyForecastDate,
      dynamic pressure,
      dynamic humidity,
      dynamic wind,
      dynamic dailyforcastsunrise,
      dynamic dailyforecastsunset,
      dynamic forecastuvi,
      dynamic mindailytempinC,
      dynamic maxdailyempinC,
      dynamic darkThemeEnabled,
      ) {
    setState(() {
      DarkThemeEnabled = darkThemeEnabled;
      minTempinC = mindailytempinC;
      maxTempinC = maxdailyempinC;
      minTemp = minDailyTemp;
      maxTemp = maxDailyTemp;
      dailyDate = dailyForecastDate;
      dailyCondition = dailyForecastCondition;
      Pressure = pressure;
      Humidity = humidity;
      Wind = wind;
      DailyForecastSunrise = dailyforcastsunrise;
      DailyForecastSunset = dailyforecastsunset;
      ForecastUvi = forecastuvi;
      //Todo - apply visibility sunrise and sunset in these containers and make list of all these in location_screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                Icons.arrow_back,
              ),
              iconSize: 24.0,
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0,
                    ),
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
                  dpressure: Pressure[0],
                  dhumidity: Humidity[0],
                  dwind: Wind[0],
                  dforecastsunrise: DailyForecastSunrise[0],
                  dforecastsunset: DailyForecastSunset[0],
                  dforecastuvi: ForecastUvi[0],
                  minTempinC: minTempinC[0],
                  maxTempinC: maxTempinC[0],
                ),
                TileDivider(),
                ExpandableWeatherTile(
                  initiallyExpanded: false,
                  date: dailyDate[1],
                  minTemp: minTemp[1],
                  maxTemp: maxTemp[1],
                  dailyCondition: dailyCondition[1],
                  dpressure: Pressure[1],
                  dhumidity: Humidity[1],
                  dwind: Wind[1],
                  dforecastsunrise: DailyForecastSunrise[1],
                  dforecastsunset: DailyForecastSunset[1],
                  dforecastuvi: ForecastUvi[1],
                  minTempinC: minTempinC[1],
                  maxTempinC: maxTempinC[1],
                ),
                TileDivider(),
                ExpandableWeatherTile(
                  initiallyExpanded: false,
                  date: dailyDate[2],
                  minTemp: minTemp[2],
                  maxTemp: maxTemp[2],
                  dailyCondition: dailyCondition[2],
                  dpressure: Pressure[2],
                  dhumidity: Humidity[2],
                  dwind: Wind[2],
                  dforecastsunrise: DailyForecastSunrise[2],
                  dforecastsunset: DailyForecastSunset[2],
                  dforecastuvi: ForecastUvi[2],
                  minTempinC: minTempinC[2],
                  maxTempinC: maxTempinC[2],
                ),
                TileDivider(),
                ExpandableWeatherTile(
                  initiallyExpanded: false,
                  date: dailyDate[3],
                  minTemp: minTemp[3],
                  maxTemp: maxTemp[3],
                  dailyCondition: dailyCondition[3],
                  dpressure: Pressure[3],
                  dhumidity: Humidity[3],
                  dwind: Wind[3],
                  dforecastsunrise: DailyForecastSunrise[3],
                  dforecastsunset: DailyForecastSunset[3],
                  dforecastuvi: ForecastUvi[3],
                  minTempinC: minTempinC[3],
                  maxTempinC: maxTempinC[3],
                ),
                TileDivider(),
                ExpandableWeatherTile(
                  initiallyExpanded: false,
                  date: dailyDate[4],
                  minTemp: minTemp[4],
                  maxTemp: maxTemp[4],
                  dailyCondition: dailyCondition[4],
                  dpressure: Pressure[4],
                  dhumidity: Humidity[4],
                  dwind: Wind[4],
                  dforecastsunrise: DailyForecastSunrise[4],
                  dforecastsunset: DailyForecastSunset[4],
                  dforecastuvi: ForecastUvi[4],
                  minTempinC: minTempinC[4],
                  maxTempinC: maxTempinC[4],
                ),
                TileDivider(),
                ExpandableWeatherTile(
                  initiallyExpanded: false,
                  date: dailyDate[5],
                  minTemp: minTemp[5],
                  maxTemp: maxTemp[5],
                  dailyCondition: dailyCondition[5],
                  dpressure: Pressure[5],
                  dhumidity: Humidity[5],
                  dwind: Wind[5],
                  dforecastsunrise: DailyForecastSunrise[5],
                  dforecastsunset: DailyForecastSunset[5],
                  dforecastuvi: ForecastUvi[5],
                  minTempinC: minTempinC[5],
                  maxTempinC: maxTempinC[5],
                ),
                TileDivider(),
                ExpandableWeatherTile(
                  initiallyExpanded: false,
                  date: dailyDate[6],
                  minTemp: minTemp[6],
                  maxTemp: maxTemp[6],
                  dailyCondition: dailyCondition[6],
                  dpressure: Pressure[6],
                  dhumidity: Humidity[6],
                  dwind: Wind[6],
                  dforecastsunrise: DailyForecastSunrise[6],
                  dforecastsunset: DailyForecastSunset[6],
                  dforecastuvi: ForecastUvi[6],
                  minTempinC: minTempinC[6],
                  maxTempinC: maxTempinC[6],
                ),
              ],
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
  ExpandableWeatherTile({
    this.date,
    this.minTemp,
    this.maxTemp,
    this.dailyCondition,
    this.initiallyExpanded,
    this.dpressure,
    this.dhumidity,
    this.dwind,
    this.dforecastsunrise,
    this.dforecastsunset,
    this.dforecastuvi,
    this.minTempinC,
    this.maxTempinC,
  });
  final initiallyExpanded;
  final date;
  final minTemp;
  final maxTemp;
  final minTempinC;
  final maxTempinC;
  final dailyCondition;
  final dpressure;
  final dhumidity;
  final dwind;
  final dforecastsunrise;
  final dforecastsunset;
  final dforecastuvi;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: initiallyExpanded,
      backgroundColor: Theme.of(context).disabledColor,
      leading: BoxedIcon(
        //  WeatherIcons.day_sunny,
        dailyCondition,
        size: 27.0,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$date',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '$minTemp°  /  $maxTemp°  ${changeUnit(maxTemp, maxTempinC)}',
            style: TextStyle(
              fontSize: 18.0,
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Pressure',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Wind',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                        '$dforecastsunrise',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text('$dpressure hPa',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),),
                    SizedBox(height: 10.0),
                    Text('$dwind km/h',
                      style: TextStyle(
                      fontSize: 16.0,
                    ),),
                    SizedBox(height: 10.0),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Sunset',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Humidity',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'UVI',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('$dforecastsunset',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),),
                    SizedBox(height: 10.0),
                    Text('$dhumidity %',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),),
                    SizedBox(height: 10.0),
                    Text('$dforecastuvi',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),),
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

String changeUnit(var temp, var tempinc) {
  if (temp == tempinc)
    return 'C';
  else
    return 'F';
}
