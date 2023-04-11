class WeatherData {
  final DateTime date;
  final String name;
  final double temp;
  final String main;
  final String icon;

  static double currentTemp = 10.0;

  WeatherData({
    this.date,
    this.name,
    this.temp,
    this.main,
    this.icon,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    updateTemp(json['main']['temp'].toDouble());

    return WeatherData(
      date: DateTime.fromMillisecondsSinceEpoch(
        json['dt'] * 1000,
        isUtc: false,
      ),
      name: json['name'],
      temp: json['main']['temp'].toDouble(),
      main: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
    );
  }

  static void updateTemp(double newTemp) {
    currentTemp = newTemp;
  }
}
