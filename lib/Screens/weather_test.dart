import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_snake_game/models/weather_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter_snake_game/widgets/Weather.dart';
import 'package:location/location.dart';

class WeatherTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WeatherState();
}

class WeatherState extends State<WeatherTest> {
  bool isLoading = false;
  WeatherData weatherData;
  Location location = Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  String error;

  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  loadWeather() async {
    String apiKey = dotenv.env["API_KEY"];
    print('1');
    setState(() {
      isLoading = true;
    });

//service ของ location
    try {
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      _locationData = await location.getLocation();

      error = null;
    } on PlatformException catch (e) {
      print("land");
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
            'Permission denied - please ask the user to enable it from the app settings';
      }

      _locationData = null;
    }

    print(_locationData);

    if (_locationData != null) {
      final lat = _locationData.latitude;
      final lon = _locationData.longitude;
      // TODO: add Await to each function here to get the number print in the order
      _fetchAndSetWeatherData(apiKey, lat, lon);
    }
    print('4');
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _fetchAndSetWeatherData(
    String apiKey,
    double lat,
    double lon,
  ) async {
    print('2');
    final weatherResponse = await dio.get(
      'https://api.openweathermap.org/data/2.5/weather?appid=$apiKey&lat=${lat.toString()}&lon=${lon.toString()}&units=metric',
    );
    if (weatherResponse.statusCode == 200) {
      return setState(() {
        weatherData = WeatherData.fromJson(weatherResponse.data);
      });
    } else {
      print(weatherResponse.statusCode);
    }
  }

  //Start Here!!!!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: weatherData != null
                        ? Weather(weather: weatherData)
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                strokeWidth: 3.0,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF006C6C),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Loading weather information...',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF006C6C),
                                  fontFamily: 'NanumPenScript',
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
