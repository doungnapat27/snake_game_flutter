import 'package:flutter/material.dart';
import 'package:flutter_snake_game/Screens/signUp.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  @override
  // double screenWidth;
  // double screenHeight;
  Widget build(BuildContext context){
    // Size size = MediaQuery.of(context).size;
    // screenWidth = MediaQuery.of(context).size.width;
    // screenHeight = MediaQuery.of(context).size.height;

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
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFFD9D9D9),
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(46))),
                    textStyle: const TextStyle(
                      fontSize: 40,
                      fontFamily: 'NanumPenScript',
                      fontStyle: FontStyle.normal,
                    )
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
      );
  }
}