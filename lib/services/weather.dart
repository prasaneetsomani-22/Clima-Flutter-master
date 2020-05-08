import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apikey = 'b681db0fef55404ef7ea38e97fec1395';

class WeatherModel {

  Future getcitylocation(String cityname) async{
    var url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey&units=metric';
    Networking networking = Networking(url);
    return await networking.getdata();
  }

  Future<dynamic> getlocationweather() async{
    Location location = Location();
    await location.getCurrentLocation();
    Networking networking = Networking('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    return await networking.getdata();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
