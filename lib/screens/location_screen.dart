import 'package:weather_app/screens/aqi_screen.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/forecast_screen.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/services/time.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:weather_app/services/block.dart';
import 'package:weather_app/screens/line_chart.dart';

class LocationScreen extends StatefulWidget {
  final weatherData;
  final forecastData;
  final aqiData;
  final bool darkThemeEnabled;
  LocationScreen(
      this.weatherData, this.forecastData, this.darkThemeEnabled, this.aqiData);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  var weatherIcon;
  String cityName;
  int feelsLike;
  String condition;
  int timezoneOffset;
  var currentDate;
  // ignore: non_constant_identifier_names
  bool DarkThemeEnabled;
  int tempInFahrenheit;
  int tempInCel;
  int pressure;
  int visibility;
  int humidity;
  int windSpeed;
  int aqi;

  var t = false;
  var timeInEpoch = new List();
  var tempForecast = new List();
  var time = new List();
  var timeIn12Hour = new List();
  var timeIn24Hour = new List();
  var forecastCondition = new List();
  var dailyForecastCondition = new List();
  var dailyForecastDate = new List();
  var minDailyTemp = new List();
  var maxDailyTemp = new List();
  var suntimeInEpoch = new List();
  var suntime = new List();
  var suntimeIn12Hour = new List();
  var suntimeIn24Hour = new List();
//  var dailyForecastSunset = new List();
//  var dailyForecastSunrise = new List();
  var dailyForecastSunsetTime = new List();
  var dailyForecastSunriseTime = new List();
  var dailyForecastSunriseIn12Hour = new List();
  var dailyForecastSunriseIn24Hour = new List();
  var dailyForecastSunsetIn12Hour = new List();
  var dailyForecastSunsetIn24Hour = new List();
  var tempForecastInCel = new List();
  var tempForecastInFar = new List();
  var minDailyTempInC = new List();
  var minDailyTempInF = new List();
  var maxDailyTempInC = new List();
  var maxDailyTempInF = new List();
  var forecastPressure = new List();
  var forecastHumidity = new List();
  var forecastWind = new List();
  var forecastVisibility = new List();
  var forecastUvi = new List();
  var forecastUviString = new List();

  WeatherModel weather = WeatherModel();
  GetTimeWeather timeWeather = GetTimeWeather();

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData, widget.forecastData, widget.aqiData);
    updateTheme(widget.darkThemeEnabled);
  }

  void updateTheme(dynamic darkThemeEnabled) {
    DarkThemeEnabled = darkThemeEnabled;
  }

  void updateUI(dynamic weatherData, dynamic forecastData, dynamic aqiData) {
    setState(() {
      if (weatherData == null || forecastData == null) {
        temperature = 0;
        weatherIcon = Icons.error;
        visibility = 0;
        pressure = 0;
        humidity = 0;
        windSpeed = 0;
        feelsLike = 0;
        return;
      }
      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      tempInCel = temperature;
      tempInFahrenheit = (1.8 * temperature + 32).toInt();
      weatherIcon = weather.getWeatherIcon(weatherData['weather'][0]['id']);
      cityName = weatherData['name'];
      var feelsLikeTemp = weatherData['main']['feels_like'];
      feelsLike = feelsLikeTemp.toInt();
      condition = weatherData['weather'][0]['description'];
      var currentTimeInEpoch = forecastData['daily'][0]['dt'];
      timezoneOffset = forecastData['timezone_offset'];
      currentDate = timeWeather.getDate(currentTimeInEpoch, timezoneOffset);
      aqi = aqiData['data']['aqi'];
      pressure = weatherData['main']['pressure'];
      visibility = weatherData['visibility'];
      humidity = weatherData['main']['humidity'];
      var wind = weatherData['wind']['speed'];
      windSpeed = wind.toInt();
      // for(int i=0;i<24;i+=2)
      // {
      //   timeInEpoch.add(forecastData['hourly'][i]['dt']);
      //   forecastCondition.add(weather.getWeatherIcon(forecastData['hourly'][i]['weather'][0]['id']));
      //   time.add(timeWeather.getTime(timeInEpoch[i~/2],timezoneOffset));
      //   tempForecast.add(forecastData['hourly'][i]['temp'].toInt());
      // }
      timeInEpoch = [
        forecastData['hourly'][0]['dt'],
        forecastData['hourly'][2]['dt'],
        forecastData['hourly'][4]['dt'],
        forecastData['hourly'][6]['dt'],
        forecastData['hourly'][8]['dt'],
        forecastData['hourly'][10]['dt'],
        forecastData['hourly'][12]['dt'],
        forecastData['hourly'][14]['dt'],
        forecastData['hourly'][16]['dt'],
        forecastData['hourly'][18]['dt'],
        forecastData['hourly'][20]['dt'],
        forecastData['hourly'][22]['dt'],
      ];

      forecastCondition = [
        weather.getWeatherIcon(forecastData['hourly'][0]['weather'][0]['id']),
        weather.getWeatherIcon(forecastData['hourly'][2]['weather'][0]['id']),
        weather.getWeatherIcon(forecastData['hourly'][4]['weather'][0]['id']),
        weather.getWeatherIcon(forecastData['hourly'][6]['weather'][0]['id']),
        weather.getWeatherIcon(forecastData['hourly'][8]['weather'][0]['id']),
        weather.getWeatherIcon(forecastData['hourly'][10]['weather'][0]['id']),
        weather.getWeatherIcon(forecastData['hourly'][12]['weather'][0]['id']),
        weather.getWeatherIcon(forecastData['hourly'][14]['weather'][0]['id']),
        weather.getWeatherIcon(forecastData['hourly'][16]['weather'][0]['id']),
        weather.getWeatherIcon(forecastData['hourly'][18]['weather'][0]['id']),
        weather.getWeatherIcon(forecastData['hourly'][20]['weather'][0]['id']),
        weather.getWeatherIcon(forecastData['hourly'][22]['weather'][0]['id']),
      ];

      timeIn12Hour = [
        timeWeather.getTimeIn12HourFormat(timeInEpoch[0], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(timeInEpoch[1], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(timeInEpoch[2], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(timeInEpoch[3], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(timeInEpoch[4], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(timeInEpoch[5], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(timeInEpoch[6], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(timeInEpoch[7], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(timeInEpoch[8], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(timeInEpoch[9], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(timeInEpoch[10], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(timeInEpoch[11], timezoneOffset),
      ];

      timeIn24Hour = [
        timeWeather.getTimeIn24HourFormat(timeInEpoch[0], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(timeInEpoch[1], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(timeInEpoch[2], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(timeInEpoch[3], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(timeInEpoch[4], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(timeInEpoch[5], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(timeInEpoch[6], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(timeInEpoch[7], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(timeInEpoch[8], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(timeInEpoch[9], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(timeInEpoch[10], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(timeInEpoch[11], timezoneOffset),
      ];

      tempForecast = [
        (forecastData['hourly'][0]['temp']).toInt(),
        (forecastData['hourly'][2]['temp']).toInt(),
        (forecastData['hourly'][4]['temp']).toInt(),
        (forecastData['hourly'][6]['temp']).toInt(),
        (forecastData['hourly'][8]['temp']).toInt(),
        (forecastData['hourly'][10]['temp']).toInt(),
        (forecastData['hourly'][12]['temp']).toInt(),
        (forecastData['hourly'][14]['temp']).toInt(),
        (forecastData['hourly'][16]['temp']).toInt(),
        (forecastData['hourly'][18]['temp']).toInt(),
        (forecastData['hourly'][20]['temp']).toInt(),
        (forecastData['hourly'][22]['temp']).toInt(),
      ];
      var dailyCondition = [
        forecastData['daily'][1]['weather'][0]['id'],
        forecastData['daily'][2]['weather'][0]['id'],
        forecastData['daily'][3]['weather'][0]['id'],
        forecastData['daily'][4]['weather'][0]['id'],
        forecastData['daily'][5]['weather'][0]['id'],
        forecastData['daily'][6]['weather'][0]['id'],
        forecastData['daily'][7]['weather'][0]['id'],
      ];
      dailyForecastCondition = [
        weather.getWeatherIcon(dailyCondition[0]),
        weather.getWeatherIcon(dailyCondition[1]),
        weather.getWeatherIcon(dailyCondition[2]),
        weather.getWeatherIcon(dailyCondition[3]),
        weather.getWeatherIcon(dailyCondition[4]),
        weather.getWeatherIcon(dailyCondition[5]),
        weather.getWeatherIcon(dailyCondition[6]),
      ];
      var dailyTimeInEpoch = [
        forecastData['daily'][1]['dt'],
        forecastData['daily'][2]['dt'],
        forecastData['daily'][3]['dt'],
        forecastData['daily'][4]['dt'],
        forecastData['daily'][5]['dt'],
        forecastData['daily'][6]['dt'],
        forecastData['daily'][7]['dt'],
      ];
      dailyForecastDate = [
        timeWeather.getDate(dailyTimeInEpoch[0], timezoneOffset),
        timeWeather.getDate(dailyTimeInEpoch[1], timezoneOffset),
        timeWeather.getDate(dailyTimeInEpoch[2], timezoneOffset),
        timeWeather.getDate(dailyTimeInEpoch[3], timezoneOffset),
        timeWeather.getDate(dailyTimeInEpoch[4], timezoneOffset),
        timeWeather.getDate(dailyTimeInEpoch[5], timezoneOffset),
        timeWeather.getDate(dailyTimeInEpoch[6], timezoneOffset),
      ];
      minDailyTemp = [
        (forecastData['daily'][1]['temp']['min']).toInt(),
        (forecastData['daily'][2]['temp']['min']).toInt(),
        (forecastData['daily'][3]['temp']['min']).toInt(),
        (forecastData['daily'][4]['temp']['min']).toInt(),
        (forecastData['daily'][5]['temp']['min']).toInt(),
        (forecastData['daily'][6]['temp']['min']).toInt(),
        (forecastData['daily'][7]['temp']['min']).toInt(),
      ];
      maxDailyTemp = [
        (forecastData['daily'][1]['temp']['max']).toInt(),
        (forecastData['daily'][2]['temp']['max']).toInt(),
        (forecastData['daily'][3]['temp']['max']).toInt(),
        (forecastData['daily'][4]['temp']['max']).toInt(),
        (forecastData['daily'][5]['temp']['max']).toInt(),
        (forecastData['daily'][6]['temp']['max']).toInt(),
        (forecastData['daily'][7]['temp']['max']).toInt(),
      ];
      suntimeInEpoch = [
        forecastData['current']['sunrise'],
        forecastData['current']['sunset'],
      ];
      var dailyForecastSunrise = [
        forecastData['daily'][1]['sunrise'],
        forecastData['daily'][2]['sunrise'],
        forecastData['daily'][3]['sunrise'],
        forecastData['daily'][4]['sunrise'],
        forecastData['daily'][5]['sunrise'],
        forecastData['daily'][6]['sunrise'],
        forecastData['daily'][7]['sunrise'],
      ];

      var dailyForecastSunset = [
        forecastData['daily'][1]['sunset'],
        forecastData['daily'][2]['sunset'],
        forecastData['daily'][3]['sunset'],
        forecastData['daily'][4]['sunset'],
        forecastData['daily'][5]['sunset'],
        forecastData['daily'][6]['sunset'],
        forecastData['daily'][7]['sunset'],
      ];
      dailyForecastSunriseIn12Hour = [
        timeWeather.getTimeIn12HourFormat(
            dailyForecastSunrise[0], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(
            dailyForecastSunrise[1], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(
            dailyForecastSunrise[2], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(
            dailyForecastSunrise[3], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(
            dailyForecastSunrise[4], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(
            dailyForecastSunrise[5], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(
            dailyForecastSunrise[6], timezoneOffset),
      ];
      dailyForecastSunriseIn24Hour = [
        timeWeather.getTimeIn24HourFormat(
            dailyForecastSunrise[0], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(
            dailyForecastSunrise[1], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(
            dailyForecastSunrise[2], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(
            dailyForecastSunrise[3], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(
            dailyForecastSunrise[4], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(
            dailyForecastSunrise[5], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(
            dailyForecastSunrise[6], timezoneOffset),
      ];

      dailyForecastSunsetIn12Hour = [
        timeWeather.getTimeIn12HourFormat(
            dailyForecastSunset[0], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(
            dailyForecastSunset[1], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(
            dailyForecastSunset[2], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(
            dailyForecastSunset[3], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(
            dailyForecastSunset[4], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(
            dailyForecastSunset[5], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(
            dailyForecastSunset[6], timezoneOffset),
      ];
      dailyForecastSunsetIn24Hour = [
        timeWeather.getTimeIn24HourFormat(
            dailyForecastSunset[0], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(
            dailyForecastSunset[1], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(
            dailyForecastSunset[2], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(
            dailyForecastSunset[3], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(
            dailyForecastSunset[4], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(
            dailyForecastSunset[5], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(
            dailyForecastSunset[6], timezoneOffset),
      ];
      suntimeIn12Hour = [
        timeWeather.getTimeIn12HourFormat(suntimeInEpoch[0], timezoneOffset),
        timeWeather.getTimeIn12HourFormat(suntimeInEpoch[1], timezoneOffset),
      ];
      suntimeIn24Hour = [
        timeWeather.getTimeIn24HourFormat(suntimeInEpoch[0], timezoneOffset),
        timeWeather.getTimeIn24HourFormat(suntimeInEpoch[1], timezoneOffset),
      ];
      tempForecastInCel = tempForecast;
      tempForecastInFar = [
        changeTemp(tempForecast[0]).toInt(),
        changeTemp(tempForecast[1]).toInt(),
        changeTemp(tempForecast[2]).toInt(),
        changeTemp(tempForecast[3]).toInt(),
        changeTemp(tempForecast[4]).toInt(),
        changeTemp(tempForecast[5]).toInt(),
        changeTemp(tempForecast[6]).toInt(),
        changeTemp(tempForecast[7]).toInt(),
        changeTemp(tempForecast[8]).toInt(),
        changeTemp(tempForecast[9]).toInt(),
        changeTemp(tempForecast[10]).toInt(),
        changeTemp(tempForecast[11]).toInt(),
      ];
      minDailyTempInC = minDailyTemp;
      minDailyTempInF = [
        changeTemp(minDailyTemp[0]).toInt(),
        changeTemp(minDailyTemp[1]).toInt(),
        changeTemp(minDailyTemp[2]).toInt(),
        changeTemp(minDailyTemp[3]).toInt(),
        changeTemp(minDailyTemp[4]).toInt(),
        changeTemp(minDailyTemp[5]).toInt(),
        changeTemp(minDailyTemp[6]).toInt(),
      ];
      forecastUvi = [
        forecastData['daily'][1]['uvi'],
        forecastData['daily'][2]['uvi'],
        forecastData['daily'][3]['uvi'],
        forecastData['daily'][4]['uvi'],
        forecastData['daily'][5]['uvi'],
        forecastData['daily'][6]['uvi'],
        forecastData['daily'][7]['uvi'],
      ];
      forecastUviString = [
        weather.getuvIndex(forecastUvi[0]),
        weather.getuvIndex(forecastUvi[1]),
        weather.getuvIndex(forecastUvi[2]),
        weather.getuvIndex(forecastUvi[3]),
        weather.getuvIndex(forecastUvi[4]),
        weather.getuvIndex(forecastUvi[5]),
        weather.getuvIndex(forecastUvi[6]),
      ];
      maxDailyTempInC = maxDailyTemp;
      maxDailyTempInF = [
        changeTemp(maxDailyTemp[0]).toInt(),
        changeTemp(maxDailyTemp[1]).toInt(),
        changeTemp(maxDailyTemp[2]).toInt(),
        changeTemp(maxDailyTemp[3]).toInt(),
        changeTemp(maxDailyTemp[4]).toInt(),
        changeTemp(maxDailyTemp[5]).toInt(),
        changeTemp(maxDailyTemp[6]).toInt(),
      ];
      forecastPressure = [
        (forecastData['daily'][1]['pressure']).toInt(),
        (forecastData['daily'][2]['pressure']).toInt(),
        (forecastData['daily'][3]['pressure']).toInt(),
        (forecastData['daily'][4]['pressure']).toInt(),
        (forecastData['daily'][5]['pressure']).toInt(),
        (forecastData['daily'][6]['pressure']).toInt(),
        (forecastData['daily'][7]['pressure']).toInt(),
      ];
      forecastHumidity = [
        (forecastData['daily'][1]['humidity']).toInt(),
        (forecastData['daily'][2]['humidity']).toInt(),
        (forecastData['daily'][3]['humidity']).toInt(),
        (forecastData['daily'][4]['humidity']).toInt(),
        (forecastData['daily'][5]['humidity']).toInt(),
        (forecastData['daily'][6]['humidity']).toInt(),
        (forecastData['daily'][7]['humidity']).toInt(),
      ];
      forecastWind = [
        (forecastData['daily'][1]['wind_speed']).toInt(),
        (forecastData['daily'][2]['wind_speed']).toInt(),
        (forecastData['daily'][3]['wind_speed']).toInt(),
        (forecastData['daily'][4]['wind_speed']).toInt(),
        (forecastData['daily'][5]['wind_speed']).toInt(),
        (forecastData['daily'][6]['wind_speed']).toInt(),
        (forecastData['daily'][7]['wind_speed']).toInt(),
      ];
      if (t == true) {
        temperature = tempInFahrenheit;
        tempForecast = tempForecastInFar;
        minDailyTemp = minDailyTempInF;
        maxDailyTemp = maxDailyTempInF;
      } else {
        temperature = tempInCel;
        tempForecast = tempForecastInCel;
        minDailyTemp = minDailyTempInC;
        maxDailyTemp = maxDailyTempInC;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool is24HoursFormat = MediaQuery.of(context).alwaysUse24HourFormat;
    setState(() {
      if (is24HoursFormat) {
        time = timeIn24Hour;
        suntime = suntimeIn24Hour;
        dailyForecastSunriseTime = dailyForecastSunriseIn24Hour;
        dailyForecastSunsetTime = dailyForecastSunsetIn24Hour;
      } else {
        time = timeIn12Hour;
        suntime = suntimeIn12Hour;
        dailyForecastSunriseTime = dailyForecastSunriseIn12Hour;
        dailyForecastSunsetTime = dailyForecastSunsetIn12Hour;
      }
    });
    return Scaffold(
      //  backgroundColor: Color(0xFF18191A), //
      appBar: AppBar(
        title: Text(
          "Weather",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              var typedCityName = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CityScreen();
                  },
                ),
              );
              if (typedCityName != null) {
                var weatherData = await weather.getCityWeather(typedCityName);
                if (weatherData == null) {
                  Alert(
                    context: context,
                    type: AlertType.error,
                    style: AlertStyle(
                      animationType: AnimationType.fromTop,
                      descStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      backgroundColor: Colors.white,
                      titleStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    title: 'ERROR ALERT',
                    desc: "Wrong city name entered",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "OK",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                      )
                    ],
                  ).show();
                }
                var latitude = weatherData['coord']['lat'];
                var longitude = weatherData['coord']['lon'];
                var forecastData =
                    await weather.getCityForecast(latitude, longitude);
                // var aqiData = await weather.getCityAQI(typedCityName);
                var aqiData = await weather.getCityAQI(latitude, longitude);
                updateUI(weatherData, forecastData, aqiData);
              }
            },
            child: Icon(
              Icons.search,
              size: 28.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 12.0),
            FlatButton(
              onPressed: () async {
                var weatherData = await weather.getLocationWeather();
                var forecastData = await weather.getLocationForecast();
                var aqiData = await weather.getLocationAQI();
                Navigator.of(context).pop();
                updateUI(weatherData, forecastData, aqiData);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Current Location',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Theme.of(context).accentIconTheme.color,
                    ),
                  ),
                  Icon(
                    Icons.near_me,
                    size: 30.0,
                  ),
                ],
              ),
            ),
            Divider(
              height: 3,
              thickness: 1,
              indent: 10,
              endIndent: 10,
              color: Colors.grey,
            ),
            FlatButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LineChartSample2(tempForecast,timeIn24Hour);
                    },
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Temperature Graph',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Theme.of(context).accentIconTheme.color,
                    ),
                  ),
                  Icon(
                    Icons.graphic_eq,
                    size: 28.0,
                  ),
                ],
              ),
            ),
            Divider(
              height: 3,
              thickness: 1,
              indent: 10,
              endIndent: 10,
              color: Colors.grey,
            ),
            ListTile(
              title: Text(
                'Celsius to Fahrenheit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Theme.of(context).accentIconTheme.color,
                ),
              ),
              trailing: Switch(
                value: t,
                onChanged: (value) {
                  setState(() {
                    t = value;
                    if (t == true) {
                      temperature = tempInFahrenheit;
                      tempForecast = tempForecastInFar;
                      minDailyTemp = minDailyTempInF;
                      maxDailyTemp = maxDailyTempInF;
                    } else {
                      temperature = tempInCel;
                      tempForecast = tempForecastInCel;
                      minDailyTemp = minDailyTempInC;
                      maxDailyTemp = maxDailyTempInC;
                    }
                  });
                },
              ),
            ),
            Divider(
              height: 2,
              thickness: 1,
              indent: 10,
              endIndent: 20,
              color: Colors.grey,
            ),
            ListTile(
              title: Text(
                "Dark Theme",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              trailing: Switch(
                value: DarkThemeEnabled,
                onChanged: (value) {
                  setState(() {
                    DarkThemeEnabled = value;
                  });
                  bloc.changeTheme(DarkThemeEnabled);
                  //  print(bloc.changeTheme);
                },
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            physics: const AlwaysScrollableScrollPhysics(),
            //   physics: ClampingScrollPhysics(),
            //  shrinkWrap: true,
            children: <Widget>[
              SizedBox(
                height: 27.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 7,
                width: MediaQuery.of(context).size.width / 6,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Text(
                      '$cityName',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 38.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width / 6,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        '$currentDate',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '   AQI',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 23.0,
                            ),
                          ),
                        ),
                        FlatButton(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Text(
                            '$aqi',
                            //   textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).accentIconTheme.color,
                              fontSize: 23.0,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return AQIScreen(aqi, cityName);
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 4,
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$temperature°',
                          style: kTempTextStyle,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: BoxedIcon(
                            weatherIcon,
                            size: 80.0,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '$condition',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width / 3,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'Today',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        FlatButton(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Text(
                            'Next 7 Days >',
                            style: TextStyle(
                              //     color: Colors.tealAccent,
                              //   color: Colors.blue,
                              fontSize: 17.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ForecastScreen(
                                dailyForecastCondition: dailyForecastCondition,
                                minDailyTemp: minDailyTemp,
                                maxDailyTemp: maxDailyTemp,
                                dailyForecastDate: dailyForecastDate,
                                pressure: forecastPressure,
                                humidity: forecastHumidity,
                                wind: forecastWind,
                                forecastDailySunrise: dailyForecastSunriseTime,
                                forecastDailySunset: dailyForecastSunsetTime,
                                forecastUvi: forecastUviString,
                                minDailyTempInC: minDailyTempInC,
                                maxDailyTempInC: maxDailyTempInC,
                                darkThemeEnabled: DarkThemeEnabled,
                              );
                            }));
                          },
                        ),
                      ],
                    ),
                    Divider(
                      height: 20,
                      thickness: 3,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      height: 105.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          SizedBox(
                            width: 10.0,
                          ),
                          HourlyForecastBox(
                            time: time[0],
                            forecastCondition: forecastCondition[0],
                            tempForecast: tempForecast[0],
                            tempInC: tempForecastInCel[0],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[1],
                            forecastCondition: forecastCondition[1],
                            tempForecast: tempForecast[1],
                            tempInC: tempForecastInCel[1],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[2],
                            forecastCondition: forecastCondition[2],
                            tempForecast: tempForecast[2],
                            tempInC: tempForecastInCel[2],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[3],
                            forecastCondition: forecastCondition[3],
                            tempForecast: tempForecast[3],
                            tempInC: tempForecastInCel[3],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[4],
                            forecastCondition: forecastCondition[4],
                            tempForecast: tempForecast[4],
                            tempInC: tempForecastInCel[4],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[5],
                            forecastCondition: forecastCondition[5],
                            tempForecast: tempForecast[5],
                            tempInC: tempForecastInCel[5],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[6],
                            forecastCondition: forecastCondition[6],
                            tempForecast: tempForecast[6],
                            tempInC: tempForecastInCel[6],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[7],
                            forecastCondition: forecastCondition[7],
                            tempForecast: tempForecast[7],
                            tempInC: tempForecastInCel[7],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[8],
                            forecastCondition: forecastCondition[8],
                            tempForecast: tempForecast[8],
                            tempInC: tempForecastInCel[8],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[9],
                            forecastCondition: forecastCondition[9],
                            tempForecast: tempForecast[9],
                            tempInC: tempForecastInCel[9],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[10],
                            forecastCondition: forecastCondition[10],
                            tempForecast: tempForecast[10],
                            tempInC: tempForecastInCel[10],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[11],
                            forecastCondition: forecastCondition[11],
                            tempForecast: tempForecast[11],
                            tempInC: tempForecastInCel[11],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width / 4,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(70.0),
                      ),
                      padding: EdgeInsets.fromLTRB(10.0, 25.0, 5.0, 25.0),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(30.0, 0, 35.0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sunrise',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Source Sans Pro',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          ' ${suntime[0]}',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sunset',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Source Sans Pro',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          ' ${suntime[1]}',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Divider(
                            height: 20,
                            thickness: 1,
                            indent: 10,
                            endIndent: 20,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(30.0, 0, 35.0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Visibility',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Source Sans Pro',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          ' ${(visibility ~/ 1000)}',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                          ),
                                        ),
                                        Text(
                                          ' Km',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Humidity',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Source Sans Pro',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          '$humidity',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                          ),
                                        ),
                                        Text(
                                          ' %',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Divider(
                            height: 20,
                            thickness: 1,
                            indent: 10,
                            endIndent: 20,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(30.0, 0, 35.0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Wind',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Source Sans Pro',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          ' $windSpeed',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.0,
                                        ),
                                        Text(
                                          ' Km/h',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pressure',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Source Sans Pro',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          '$pressure',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                          ),
                                        ),
                                        SizedBox(width: 2.0),
                                        Text(
                                          ' hPa',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HourlyForecastBox extends StatelessWidget {
  HourlyForecastBox(
      {this.time, this.forecastCondition, this.tempForecast, this.tempInC});
  final time;
  final forecastCondition;
  final tempForecast;
  final tempInC;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).hintColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            '$time',
            textAlign: TextAlign.center,
          ),
          Align(
            alignment: Alignment.center,
            child: BoxedIcon(
              forecastCondition,
              size: 21.0,
            ),
          ),
          Text('$tempForecast° ${changeUnit(tempForecast, tempInC)}'),
        ],
      ),
    );
  }
}

dynamic changeTemp(var temp) {
  return (1.8 * temp + 32);
}

String changeUnit(var temp, var tempInC) {
  if (temp == tempInC)
    return 'C';
  else
    return 'F';
}
