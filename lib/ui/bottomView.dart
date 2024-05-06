// ignore_for_file: prefer_const_constructors



import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/WeatherForecastModel.dart';
import 'forecastCard.dart';



Widget bottomView(AsyncSnapshot <WeatherForecastModel> snapshot , BuildContext context)
{
  var list = snapshot.data?.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text("7 days weather forecast".toUpperCase(),style: TextStyle(
        fontSize: 16.0,
        color: Colors.grey
      ),),
      SizedBox(height: 8.0,),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        height: 170,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return ClipRRect(

                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                 child: Container(
                   width: MediaQuery.of(context).size.width/2.1,
                   height: 110,
                   decoration: BoxDecoration(
                     gradient: LinearGradient(colors: const [Color(0xff9661C3),Colors.white],begin: Alignment.topLeft,end: Alignment.bottomRight)
                   ),
                   child:  forecastCard(snapshot,index),
                 )
                
              );

            },
            separatorBuilder: (context,index) =>  SizedBox(width: 8.0,),
            itemCount: list!.length),

      )
    ],
  );
}
