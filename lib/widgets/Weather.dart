import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_snake_game/models/weather_data.dart';

class Weather extends StatelessWidget {
  final WeatherData weather;
  final Color color;

  Weather({
    this.weather,
    this.color,
  });

    Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 10,
      color: Color(0xFF006C6C),
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              weather.name.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              weather.main.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${weather.temp.toStringAsFixed(1)}°C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Image.network(
              'https://openweathermap.org/img/w/${weather.icon}.png',
              width: 60,
              height: 60,
            ),
            SizedBox(height: 10),
            Text(
              DateFormat.yMMMd().format(weather.date),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              DateFormat.Hm().format(weather.date),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
