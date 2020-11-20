import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class LoadingScreen extends StatefulWidget {
  final bool darkThemeEnabled;
  LoadingScreen(this.darkThemeEnabled);
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData(
      widget.darkThemeEnabled,
    );
  }

  Future<Widget> getLocationData(bool darkThemeEnabled) async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    var forecastData = await weatherModel.getLocationForecast();
    var aqiData = await weatherModel.getLocationAQI();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(
            weatherData, forecastData, darkThemeEnabled, aqiData);
      }),
    );
    return Future.value(
        LocationScreen(weatherData, forecastData, darkThemeEnabled, aqiData));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
        seconds: 5,
        routeName: '/',
        navigateAfterFuture: getLocationData(widget.darkThemeEnabled),
        image: Image.asset('images/logo.jpg'),
        backgroundColor: Colors.white,
        photoSize: 110.0,
        loaderColor: Colors.red,
      ),
    );
  }
}
