// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_forecast/Networking/Network.dart';
import 'package:weather_forecast/model/WeatherForecastModel.dart';

import '../ui/bottomView.dart';
import '../ui/midView.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> weatherForecastData;
  String _cityName = "Lahore";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherForecastData = Network().getWeatherForecast(cityName: _cityName);
    // weatherForecastData.then(
    //     (value) => print(" CityName:  ${value.list![0].weather?[0].main}"));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        SizedBox(
          height: 8.0,
        ),
        Padding(padding: EdgeInsets.only(bottom: 5.0), child: Search()),
        Container(
          child: FutureBuilder(
              future: weatherForecastData,
              builder: (context, AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[

                      midView(snapshot),
                      bottomView( snapshot, context)

                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),


        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 150),
        //   child: TextField(
        //     decoration: InputDecoration(
        //       hintText: "Search second",
        //       prefixIcon: Icon(Icons.search_off_outlined),
        //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
        //
        //     ),
        //   ),
        // )
      ],
    ));
  }

  Widget Search() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: "Enter City name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
      ),
      onSubmitted: (value) {
        setState(() {
          _cityName = value;
          weatherForecastData =
              Network().getWeatherForecast(cityName: _cityName);
          weatherForecastData.then((value) => print(value.city?.name));
        });
      },

      // padding: EdgeInsets.symmetric(horizontal: 5.0),
      // child: Padding(padding: EdgeInsets.symmetric(vertical: 5.0),
      //   child: SearchBar(
      //     elevation: MaterialStatePropertyAll(3.0),
      //     hintText: "Enter City Name",
      //     leading: Icon(Icons.search),
      //   //   onChanged: (value){
      //     setState(() {
      //       _cityName = value;
      //       print(_cityName);
      //       weatherForecastData = Network().getWeatherForecast(cityName: _cityName);
      //     });
      //   },
      // ),

      // ),
    );
  }
}
