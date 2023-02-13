import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{
  @override
  double screenWidth;
  double screenHeight;
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF006C6C),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: screenHeight*0.05,
            child : Icon(
              Icons.arrow_back,
              size: 46,
              color: Colors.white,
            )
          ),
          Positioned(
            top: screenHeight*0.15,
            child : Image(
              image: AssetImage(
                  'assets/images/snakie_green.png'),
            ),
          ),
          Positioned(
            top: screenHeight*0.21,
            left: screenWidth*0.1,
            child : Image(
              image: AssetImage(
                  'assets/images/Logo2 white.png'),
              width: screenWidth*0.8,
            ),
          ),
          Positioned(
            top: screenHeight*0.29,
            right:0,
            child : Image(
              image: AssetImage(
                  'assets/images/snakie_yellow.png'),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                topLeft:Radius.circular(57)
                )
              ),
              width: screenWidth,
              height: screenHeight*0.65,
            ),
          ),
        ],
      ),
    );
  }
}