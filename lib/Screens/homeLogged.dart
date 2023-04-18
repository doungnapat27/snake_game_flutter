import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_game/Screens/howToPlay.dart';
import 'package:flutter_snake_game/Screens/setting.dart';
import 'package:flutter_snake_game/Screens/loginPage.dart';
import 'package:flutter_snake_game/game.dart';

import '../models/profile.dart';

class HomeLogged extends StatelessWidget {
  double screenWidth;
  double screenHeight;

  Profile profile = Profile();
  final auth = FirebaseAuth.instance;
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Scaffold(
              appBar: AppBar(title: Text("Error"),),
              body: Center(child: Text("${snapshot.error}"),),
            );
          }
          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
            return Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/bg_home.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: screenHeight*0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            auth.signOut();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                          icon: Icon(Icons.logout),
                          color: Colors.black,
                          iconSize: 30.0,
                        ),
                      ],
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Welcome!",
                            style: TextStyle(
                              fontFamily: 'NanumPenScript',
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF006C6C),
                            ),
                          ),
                          FutureBuilder<String>(
                              future: profile.getName(),
                              builder: (context , snapshot){
                                if(snapshot.hasData){
                                  return Text(snapshot.data,
                                    style: TextStyle(
                                      fontFamily: 'NanumPenScript',
                                      fontSize: 32,
                                      color: Colors.black,
                                    ),
                                  );
                                }
                                return CircularProgressIndicator();
                              }
                          ),
                          SizedBox(
                            height: screenHeight*0.03,
                          ),
                          Image(
                            image: AssetImage(
                                'assets/images/Logo2.png'),
                            width: 300.0,
                          ),
                          SizedBox(
                            height: screenHeight*0.03,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GamePage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF006C6C),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(46))),
                                textStyle: const TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'NanumPenScript',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Play'),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight*0.03,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HowToPlay()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF006C6C),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(46))),
                                textStyle: const TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'NanumPenScript',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('How to Play'),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight*0.03,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                //MaterialPageRoute(builder: (context) => WeatherTest()),
                                MaterialPageRoute(builder: (context) => setting()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF006C6C),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(46))),
                                textStyle: const TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'NanumPenScript',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Setting'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
            );
          }
          if(!snapshot.hasData){
            return LoginPage();
          }
          return Scaffold(
              body:Center(
                child: CircularProgressIndicator(),
              )
          );
        }
    );
  }
}