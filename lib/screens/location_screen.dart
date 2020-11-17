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
// import 'package:syncfusion_flutter_gauges/gauges.dart';

class LocationScreen extends StatefulWidget {
  final weatherData;
  final forecastData;
  final aqiData;
  LocationScreen(this.weatherData, this.forecastData, this.aqiData);
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
  int aqi;
  WeatherModel weather = WeatherModel();
  GetTimeWeather timeWeather = GetTimeWeather();

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData, widget.forecastData, widget.aqiData);
  }

  void updateUI(dynamic weatherData, dynamic forecastData, dynamic aqiData) {
    setState(() {
      if (weatherData == null || forecastData == null) {
        temperature = 0;
        weatherIcon = Icons.error;
        feelsLike = 0;
        return;
      }
      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      weatherIcon = weather.getWeatherIcon(weatherData['weather'][0]['id']);
      cityName = weatherData['name'];
      var feelsLikeTemp = weatherData['main']['feels_like'];
      feelsLike = feelsLikeTemp.toInt();
      condition = weatherData['weather'][0]['description'];
      var currentTimeInEpoch = forecastData['daily'][0]['dt'];
      timezoneOffset = forecastData['timezone_offset'];
      currentDate = timeWeather.getDate(currentTimeInEpoch, timezoneOffset);
      aqi = aqiData['data']['aqi'];
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
    });
  }

  @override
  Widget build(BuildContext context) {
    bool is24HoursFormat = MediaQuery.of(context).alwaysUse24HourFormat;
    setState(() {
      if (is24HoursFormat) {
        time = timeIn24Hour;
      } else {
        time = timeIn12Hour;
      }
    });
    return Scaffold(
      //  backgroundColor: Color(0xFF18191A), //
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      var forecastData = await weather.getLocationForecast();
                      var aqiData = await weather.getLocationAQI();
                      updateUI(weatherData, forecastData, aqiData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 40.0,
                      //   color: Theme.of(context).accentIconTheme.color,
                    ),
                  ),
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
                        var weatherData =
                            await weather.getCityWeather(typedCityName);
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
                       var aqiData = await weather.getCityAQI(typedCityName);
                       // var aqiData = await weather.getCityAQI(latitude, longitude);
                        updateUI(weatherData, forecastData, aqiData);
                      }
                    },
                    child: Icon(
                       Icons.location_city,
                   //   Icons.add_location,
                   //  Icons.location_searching,
                      size: 40.0,
                      //   color: Theme.of(context).accentIconTheme.color,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height/7,
                width: MediaQuery.of(context).size.width/6,
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
                height: MediaQuery.of(context).size.height/6,
                width: MediaQuery.of(context).size.width/6,
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
                            'AQI ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 23.0,
                            ),
                          ),
                        ),
                        FlatButton(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          child: Text(
                            '$aqi',
                            textAlign: TextAlign.center,
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
                                return AQIScreen(aqi,cityName);
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
                height: MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width/4,
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
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width/3,
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
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          child: Text(
                            'Next 7 Days >',
                            style: TextStyle(
                              //     color: Color(0xFFBB86FC),
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
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[1],
                            forecastCondition: forecastCondition[1],
                            tempForecast: tempForecast[1],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[2],
                            forecastCondition: forecastCondition[2],
                            tempForecast: tempForecast[2],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[3],
                            forecastCondition: forecastCondition[3],
                            tempForecast: tempForecast[3],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[4],
                            forecastCondition: forecastCondition[4],
                            tempForecast: tempForecast[4],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[5],
                            forecastCondition: forecastCondition[5],
                            tempForecast: tempForecast[5],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[6],
                            forecastCondition: forecastCondition[6],
                            tempForecast: tempForecast[6],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[7],
                            forecastCondition: forecastCondition[7],
                            tempForecast: tempForecast[7],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[8],
                            forecastCondition: forecastCondition[8],
                            tempForecast: tempForecast[8],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[9],
                            forecastCondition: forecastCondition[9],
                            tempForecast: tempForecast[9],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[10],
                            forecastCondition: forecastCondition[10],
                            tempForecast: tempForecast[10],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          HourlyForecastBox(
                            time: time[11],
                            forecastCondition: forecastCondition[11],
                            tempForecast: tempForecast[11],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          //     Container(
          //       height: MediaQuery.of(context).size.height/2,
          //         width: MediaQuery.of(context).size.width/2,
          //         child: ListView(
          //           physics: NeverScrollableScrollPhysics(),
          //           children: <Widget> [
          //             SfRadialGauge(
          //               axes: <RadialAxis>[
          //                 RadialAxis(
          //                   minimum: 0,
          //                   maximum: 500,
          //                     ranges: <GaugeRange>[
          //                       GaugeRange(startValue: 0, endValue: 50, color:Colors.green),
          //                       GaugeRange(startValue: 50,endValue: 100,color: Color(0xFFA3C853)),
          //                       GaugeRange(startValue: 100,endValue: 200,color: Colors.yellow),
          //                       GaugeRange(startValue: 200,endValue: 300,color: Colors.orange),
          //                       GaugeRange(startValue: 300,endValue: 400,color: Colors.red),
          //                       GaugeRange(startValue: 400,endValue: 500,color: Color(0xFF7D0022)),
          //                     ],
          //                     pointers: <GaugePointer>[
          //                       NeedlePointer(
          //                           value: aqi.toDouble(),
          //                         enableAnimation: true,
          //                       ),
          //                     ],
          //                     annotations: <GaugeAnnotation>[
          //                       GaugeAnnotation(
          //                         widget: Container(
          //                         child: Text(
          //                           '$aqi',
          //                           style: TextStyle(
          //                               fontSize: 27,
          //                               fontWeight: FontWeight.bold,
          //                           ),
          //                       ),
          //                       ),
          //                           angle: 90, positionFactor: 0.5,
          //                       ),
          //                     ],
          //                 ),
          //               ],
          //           ),
          // ],
          //         ),
          //     ),
            ],
          ),
        ),
      ),
    );
  }
}

class HourlyForecastBox extends StatelessWidget {
  HourlyForecastBox({this.time, this.forecastCondition, this.tempForecast});
  final time;
  final forecastCondition;
  final tempForecast;

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
          Text(' $tempForecast°'),
        ],
      ),
    );
  }
}
