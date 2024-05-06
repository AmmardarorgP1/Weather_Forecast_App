  import 'package:flutter/cupertino.dart';
  import 'package:font_awesome_flutter/font_awesome_flutter.dart';
  import 'package:flutter/material.dart';


  Widget getWeatherIcon({String? weather, Color? color, double? size})
  {

    if(weather == "Clouds")
      {
        return Icon(FontAwesomeIcons.cloud,color: color,size: size,);
      }
    else if (weather == "Rain")
      {
        return Icon(FontAwesomeIcons.cloudRain,color: color,size: size,);

      }
    else if (weather == "Clear")
      {
        return Icon(FontAwesomeIcons.sun,color: color,size: size,);

      }
    else if (weather == "Snow")
      {
        return Icon(FontAwesomeIcons.snowflake,color: color,size: size,);

      }
    else
      {
        return Icon(FontAwesomeIcons.cloudSun,color: color,size: size,);

      }

  }