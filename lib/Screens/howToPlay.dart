import 'package:flutter/material.dart';
class HowToPlay extends StatelessWidget {
  // const HowToPlay({ super.key });
  double screenWidth;
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: screenWidth*0.8,top:screenHeight*0.05),
                child : IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,size: 46,
                  ),
                  color: Color(0xFF006C6C),
                )
            ),
            Container(
              margin: EdgeInsets.only(top: screenHeight*0.05),
              child: Text('How to Play',
                  style : TextStyle(
                    fontSize: 48,
                    fontFamily: 'NanumPenScript',
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:screenHeight*0.005),
              width: screenWidth*0.6,
              child: RichText(
                text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:'Tab the ',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'NanumPenScript',
                              color: Color(0xFF434343),
                          ),
                      ),
                      TextSpan(
                        text:'gamepad ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'NanumPenScript',
                          color: Color(0xFFA3D5A5),
                        ),
                      ),
                      TextSpan(
                        text:'to make your ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'NanumPenScript',
                          color: Color(0xFF434343),
                        ),
                      ),
                      TextSpan(
                        text:'snake ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'NanumPenScript',
                          color: Color(0xFF8BC34A),
                        ),
                      ),
                      TextSpan(
                        text:'turn left, right, up or down. ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'NanumPenScript',
                          color: Color(0xFF434343),
                        ),
                      ),
                    ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:screenHeight*0.01),
              child: Image(
                image: AssetImage('assets/images/gamepad_ex.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:screenHeight*0.02),
              width: screenWidth*0.6,
              child: RichText(
                text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:'The ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'NanumPenScript',
                          color: Color(0xFF434343),
                        ),
                      ),
                      TextSpan(
                        text:'goal ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'NanumPenScript',
                          color: Color(0xFFB81010),
                        ),
                      ),
                      TextSpan(
                        text:'of the game is to control your ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'NanumPenScript',
                          color: Color(0xFF434343),
                        ),
                      ),
                      TextSpan(
                        text:'snake ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'NanumPenScript',
                          color: Color(0xFF8BC34A),
                        ),
                      ),
                      TextSpan(
                        text:'to swallow the ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'NanumPenScript',
                          color: Color(0xFF434343),
                        ),
                      ),
                      TextSpan(
                        text:'food ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'NanumPenScript',
                          color: Color(0xFFD0D999),
                        ),
                      ),
                      TextSpan(
                        text:'as much as you can. ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'NanumPenScript',
                          color: Color(0xFF434343),
                        ),
                      ),
                    ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:screenHeight*0.02),
              child: Image(
                image: AssetImage('assets/images/snake_and_food_ex.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}