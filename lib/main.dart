import 'package:flutter/material.dart';
import 'package:flutter_snake_game/Screens/home.dart';
import 'package:flutter_snake_game/Screens/homeLogged.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'Screens/loginPage.dart';
import 'models/profile.dart';


Future main() async{
  Profile profile = Profile();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // Check if it is the first launch of the app
  bool isFirstLaunch = await profile.isFirstLaunch();
  // Navigate to the appropriate screen
  // Widget initialScreen;
  Widget initialScreen = isFirstLaunch ? HomePage() : LoginPage();
  //profile.getEmail() == null ? LoginPage() : HomeLogged()
  // if(isFirstLaunch == false){
  //   initialScreen = HomePage();
  // }
  // else{
  //   if(profile.getEmail() != null){
  //     initialScreen = HomeLogged();
  //   }
  //   else{
  //     initialScreen = LoginPage();
  //   }
  // }
  // runApp(MyApp());
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Snake',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: initialScreen,
    // home: profile.email == null ? LoginPage() : HomeLogged(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Snake',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomePage(),
    );
  }
}
