import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_app/services/time.dart';

class ForecastScreen extends StatefulWidget {
  final dailyForecastCondition;
  final minDailyTemp;
  final maxDailyTemp;
  final minDailyTempInC;
  final maxDailyTempInC;
  final dailyForecastDate;
  final pressure;
  final humidity;
  final wind;
  final forecastDailySunrise;
  final forecastDailySunset;
  final forecastUvi;
  final bool darkThemeEnabled;

  ForecastScreen({
    this.dailyForecastCondition,
    this.minDailyTemp,
    this.maxDailyTemp,
    this.dailyForecastDate,
    this.pressure,
    this.humidity,
    this.wind,
    this.forecastDailySunrise,
    this.forecastDailySunset,
    this.forecastUvi,
    this.minDailyTempInC,
    this.maxDailyTempInC,
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
  var minTempInC = new List();
  var maxTempInC = new List();

  var dailyCondition = new List();
  var Pressure = new List();
  var Humidity = new List();
  var Wind = new List();
  var dailyForecastSunrise = new List();
  var dailyForecastSunset = new List();
  var forecastUvi = new List();
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
      widget.forecastDailySunrise,
      widget.forecastDailySunset,
      widget.forecastUvi,
      widget.minDailyTempInC,
      widget.maxDailyTempInC,
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
    dynamic dailyforecastSunrise,
    dynamic dailyforecastSunset,
    dynamic forecastUVI,
    dynamic mindailyTempinC,
    dynamic maxdailyTempinC,
    dynamic darkThemeEnabled,
  ) {
    setState(() {
      DarkThemeEnabled = darkThemeEnabled;
      minTempInC = mindailyTempinC;
      maxTempInC = maxdailyTempinC;
      minTemp = minDailyTemp;
      maxTemp = maxDailyTemp;
      dailyDate = dailyForecastDate;
      dailyCondition = dailyForecastCondition;
      Pressure = pressure;
      Humidity = humidity;
      Wind = wind;
      dailyForecastSunrise = dailyforecastSunrise;
      dailyForecastSunset = dailyforecastSunset;
      forecastUvi = forecastUVI;
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
              fontSize: 20,
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
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                  child: Text(
                    'Next 7 days',
                    style: TextStyle(
                      fontSize: 26.0,
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
                dPressure: Pressure[0],
                dHumidity: Humidity[0],
                dWind: Wind[0],
                dForecastSunrise: dailyForecastSunrise[0],
                dForecastSunset: dailyForecastSunset[0],
                dForecastUvi: forecastUvi[0],
                minTempInC: minTempInC[0],
                maxTempInC: maxTempInC[0],
              ),
              TileDivider(),
              ExpandableWeatherTile(
                initiallyExpanded: false,
                date: dailyDate[1],
                minTemp: minTemp[1],
                maxTemp: maxTemp[1],
                dailyCondition: dailyCondition[1],
                dPressure: Pressure[1],
                dHumidity: Humidity[1],
                dWind: Wind[1],
                dForecastSunrise: dailyForecastSunrise[1],
                dForecastSunset: dailyForecastSunset[1],
                dForecastUvi: forecastUvi[1],
                minTempInC: minTempInC[1],
                maxTempInC: maxTempInC[1],
              ),
              TileDivider(),
              ExpandableWeatherTile(
                initiallyExpanded: false,
                date: dailyDate[2],
                minTemp: minTemp[2],
                maxTemp: maxTemp[2],
                dailyCondition: dailyCondition[2],
                dPressure: Pressure[2],
                dHumidity: Humidity[2],
                dWind: Wind[2],
                dForecastSunrise: dailyForecastSunrise[2],
                dForecastSunset: dailyForecastSunset[2],
                dForecastUvi: forecastUvi[2],
                minTempInC: minTempInC[2],
                maxTempInC: maxTempInC[2],
              ),
              TileDivider(),
              ExpandableWeatherTile(
                initiallyExpanded: false,
                date: dailyDate[3],
                minTemp: minTemp[3],
                maxTemp: maxTemp[3],
                dailyCondition: dailyCondition[3],
                dPressure: Pressure[3],
                dHumidity: Humidity[3],
                dWind: Wind[3],
                dForecastSunrise: dailyForecastSunrise[3],
                dForecastSunset: dailyForecastSunset[3],
                dForecastUvi: forecastUvi[3],
                minTempInC: minTempInC[3],
                maxTempInC: maxTempInC[3],
              ),
              TileDivider(),
              ExpandableWeatherTile(
                initiallyExpanded: false,
                date: dailyDate[4],
                minTemp: minTemp[4],
                maxTemp: maxTemp[4],
                dailyCondition: dailyCondition[4],
                dPressure: Pressure[4],
                dHumidity: Humidity[4],
                dWind: Wind[4],
                dForecastSunrise: dailyForecastSunrise[4],
                dForecastSunset: dailyForecastSunset[4],
                dForecastUvi: forecastUvi[4],
                minTempInC: minTempInC[4],
                maxTempInC: maxTempInC[4],
              ),
              TileDivider(),
              ExpandableWeatherTile(
                initiallyExpanded: false,
                date: dailyDate[5],
                minTemp: minTemp[5],
                maxTemp: maxTemp[5],
                dailyCondition: dailyCondition[5],
                dPressure: Pressure[5],
                dHumidity: Humidity[5],
                dWind: Wind[5],
                dForecastSunrise: dailyForecastSunrise[5],
                dForecastSunset: dailyForecastSunset[5],
                dForecastUvi: forecastUvi[5],
                minTempInC: minTempInC[5],
                maxTempInC: maxTempInC[5],
              ),
              TileDivider(),
              ExpandableWeatherTile(
                initiallyExpanded: false,
                date: dailyDate[6],
                minTemp: minTemp[6],
                maxTemp: maxTemp[6],
                dailyCondition: dailyCondition[6],
                dPressure: Pressure[6],
                dHumidity: Humidity[6],
                dWind: Wind[6],
                dForecastSunrise: dailyForecastSunrise[6],
                dForecastSunset: dailyForecastSunset[6],
                dForecastUvi: forecastUvi[6],
                minTempInC: minTempInC[6],
                maxTempInC: maxTempInC[6],
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
    this.dPressure,
    this.dHumidity,
    this.dWind,
    this.dForecastSunrise,
    this.dForecastSunset,
    this.dForecastUvi,
    this.minTempInC,
    this.maxTempInC,
  });
  final initiallyExpanded;
  final date;
  final minTemp;
  final maxTemp;
  final minTempInC;
  final maxTempInC;
  final dailyCondition;
  final dPressure;
  final dHumidity;
  final dWind;
  final dForecastSunrise;
  final dForecastSunset;
  final dForecastUvi;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: initiallyExpanded,
      backgroundColor: Theme.of(context).disabledColor,
      leading: BoxedIcon(
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
            '$minTemp°  /  $maxTemp°  ${changeUnit(maxTemp, maxTempInC)}',
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
                      '$dForecastSunrise',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '$dPressure hPa',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '$dWind km/h',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
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
                    Text(
                      '$dForecastSunset',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '$dHumidity %',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '$dForecastUvi',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
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
