import 'package:shared_preferences/shared_preferences.dart';

class Profile{
  String email;
  String password;
  String name;
  Profile({this.email,this.password});

  Future<void> setEmail(String _email) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', _email);
  }
  Future<void> setName(String _name) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('snakeName', _name);
  }
  Future<String> getName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('snakeName')?? "";
    return name;
  }
  Future<String> getEmail() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email')?? "";
    return email;
  }

  Future<bool> isFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('first_launch') ?? true;
    if (isFirstLaunch) {
      prefs.setBool('first_launch', false);
    }
    return isFirstLaunch;
  }
}