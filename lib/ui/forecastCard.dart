// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/utils/getWeatherIcon.dart';
import 'package:weather_forecast/utils/utils.dart';

import '../model/WeatherForecastModel.dart';


Widget? forecastCard(AsyncSnapshot<WeatherForecastModel>snapshot,int index)
{
  var list = snapshot.data?.list;
  var dateFull = Utils.getFormattedDate(DateTime.fromMillisecondsSinceEpoch((list![index].dt!) * 1000));
  var date = dateFull.split(",")[0];


  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(date,style: TextStyle(
          fontWeight: FontWeight.w500
        ),),),

      ),
      SizedBox(height:15.0,),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
               child: getWeatherIcon(weather: list[0].weather?[0].main,color: Colors.pinkAccent,size: 40),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(

                  children: <Widget>[

                    Text("${list[0].main?.tempMin?.toStringAsFixed(0)}°C", style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: CircleAvatar(radius: 8,backgroundColor: Colors.white,child: Icon(Icons.arrow_downward_outlined,size: 12,color: Colors.black,)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(

                  children: <Widget>[

                    Text("${list[0].main?.tempMax?.toStringAsFixed(0)}°C", style: TextStyle(
                        fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: CircleAvatar(radius: 8,backgroundColor: Colors.white,child: Icon(Icons.arrow_upward,size: 12,color: Colors.black,)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                child: Row(

                  children: <Widget>[

                    Text("Hum: ", style: TextStyle(
                        fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),),
                    Text("${list[0].main?.humidity}%", style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                    ),)

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 1),
                child: Row(

                  children: <Widget>[

                    Text("Win: ", style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    ),),
                    Text("${list[0].wind?.speed?.toStringAsFixed(1)}mi/h  ", style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                    ),)

                  ],
                ),
              ),


            ],
          )
        ],
      )

    ],
  )  ;
}