import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/weather.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:splashscreen/splashscreen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future<Widget> getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    var forecastData = await weatherModel.getLocationForecast();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(weatherData, forecastData);
      }),
    );
    return Future.value(LocationScreen(weatherData, forecastData));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
        seconds: 5,
        routeName: '/',
        navigateAfterFuture: getLocationData(),
        image: Image.asset('images/logo.jpg'),
       backgroundColor: Colors.white,
        photoSize: 110.0,
        loaderColor: Colors.red,
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//           child: SpinKitFadingCube(
//             color: Colors.greenAccent,
//             size: 100.0,
//           ),
//         ),
//     );
//   }
// }
