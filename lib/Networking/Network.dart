import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_forecast/model/WeatherForecastModel.dart';
import 'package:weather_forecast/utils/utils.dart';

class Network
{
Future<WeatherForecastModel> getWeatherForecast({required String cityName}) async{
  final String url = "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=${Utils.appId}";
  print("Url:  $url");

  final response = await get(Uri.parse(Uri.encodeFull(url)));
  // print("Body:  ${response.body}");
  if(response.statusCode==200)
    {
      //we get actually mapped model dart object
      print("Weather data:  ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }
  else
  {
    throw Exception("Error getting weather API");
  }

}

}