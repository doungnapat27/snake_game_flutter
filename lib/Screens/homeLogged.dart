import 'package:flutter/material.dart';
import 'package:flutter_snake_game/Screens/howToPlay.dart';
import 'package:flutter_snake_game/game.dart';

class HomeLogged extends StatelessWidget {
  double screenWidth;
  double screenHeight;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/bg_home.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                    primary: Color(0xFF006C6C),
                    onPrimary: Colors.white,
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
                    primary: Color(0xFF006C6C),
                    onPrimary: Colors.white,
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Setting()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF006C6C),
                    onPrimary: Colors.white,
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
      ),
    );
  }
}