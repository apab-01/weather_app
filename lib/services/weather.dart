import 'package:weather_app/services/networking.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_icons/weather_icons.dart';

const apiKey = '1645cd387747d60c320d465f546474e6';

class WeatherModel {

  Future<dynamic> getCityWeather(dynamic cityName) async {
    NetworkHelper network = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await network.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location l = Location();
    await l.getCurrentLocation();
    NetworkHelper network = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${l
            .latitude}&lon=${l.longitude}&appid=$apiKey&units=metric');
    var weatherData = await network.getData();
    return weatherData;
  }
  Future<dynamic> getCityForecast(dynamic latitude,dynamic longitude) async {
    NetworkHelper network = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=minutely&appid=$apiKey&units=metric');
    var forecastData = await network.getData();
    return forecastData;
  }

  Future<dynamic> getLocationForecast() async {
    Location l = Location();
    await l.getCurrentLocation();
    NetworkHelper network = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${l.latitude}&lon=${l.longitude}&exclude=minutely&appid=$apiKey&units=metric');
    var forecastData = await network.getData();
    return forecastData;
  }

  // Future<dynamic> getCityForecast(dynamic cityName) async {
  //   NetworkHelper network = NetworkHelper(
  //       'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey&units=metric');
  //   var forecastData = await network.getData();
  //   return forecastData;
  // }
  //
  // Future<dynamic> getLocationForecast() async {
  //   Location l = Location();
  //   await l.getCurrentLocation();
  //   NetworkHelper network = NetworkHelper(
  //       'https://api.openweathermap.org/data/2.5/forecast?lat=${l
  //           .latitude}&lon=${l.longitude}&appid=$apiKey&units=metric');
  //   var forecastData = await network.getData();
  //   return forecastData;
  // }

  dynamic getWeatherIcon(int condition) {
    if (condition >= 200 && condition <= 232) {
      return WeatherIcons.storm_showers;
    } else if (condition >= 300 && condition <= 321) {
      return WeatherIcons.showers;
    } else if (condition >= 500 && condition <= 531) {
      return WeatherIcons.rain;
    } else if (condition >= 600 && condition <= 622) {
      return WeatherIcons.snowflake_cold;
    } else if (condition >= 701 && condition <= 771) {
      return WeatherIcons.fog;
    } else if (condition == 800) {
      return WeatherIcons.day_sunny;
    } else if (condition == 801 || condition == 802){
      return WeatherIcons.cloud;
    } else if ( condition == 803 || condition == 804 ) {
      return WeatherIcons.cloudy;
    }
  }
}