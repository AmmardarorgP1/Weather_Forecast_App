// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/utils/getWeatherIcon.dart';
import 'package:weather_forecast/utils/utils.dart';

import '../model/WeatherForecastModel.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var list = snapshot.data?.list;
  var cityName = snapshot.data?.city?.name;
  var country = snapshot.data?.city?.country;
  var formattedDate = Utils.getFormattedDate(
      DateTime.fromMillisecondsSinceEpoch((list?[0].
      dt ?? 0) * 1000));
  Container midView = Container(
    padding: EdgeInsets.all(16.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Center(
            child: Text(
              "$cityName, $country",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 18.0),
            ),
          ),
          Text(
            formattedDate,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:getWeatherIcon(weather: list![0].weather?[0].main,color: Colors.pinkAccent, size: 195),

          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${(list?[0].main?.temp?.toStringAsFixed(0))}°C",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(width: 8.0,),
                Text(
                  "${list![0].weather?[0].description?.toUpperCase()}",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${list[0].wind?.speed}mi/h",style: TextStyle(
                        fontSize: 12.0
                      ),),
                      Icon(FontAwesomeIcons.wind,size: 25,color: Colors.brown,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${list[0].main?.humidity}%",style: TextStyle(
                          fontSize: 12.0
                      ),),
                      Icon(FontAwesomeIcons.solidFaceGrinBeam,size: 25,color: Colors.brown,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${list[0].main?.tempMax?.toStringAsFixed(0)}°C",style: TextStyle(
                          fontSize: 12.0
                      ),),
                      Icon(FontAwesomeIcons.temperatureHigh,size: 25,color: Colors.brown,)
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
  );

  return midView;
}
