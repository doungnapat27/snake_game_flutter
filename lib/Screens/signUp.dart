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
            child : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back,size: 46,
              ),
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
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(30) ,
                    alignment: Alignment.topLeft,
                    child: Text('🐍 Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NanumPenScript',
                        fontSize: 48,
                      )
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left:30) ,
                      alignment: Alignment.topLeft,
                    child: Text('Email',
                        style: TextStyle(
                          fontFamily: 'NanumPenScript',
                          fontSize: 24,
                        )
                    )
                  ),
                  SizedBox(
                    // padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                    width: screenWidth*0.9,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(39.0)
                        ),
                        filled: true,
                        fillColor: Color(0xFFD9D9D9),
                        hintText: 'example@gmail.com',
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left:30,top:20) ,
                      alignment: Alignment.topLeft,
                      child: Text('Password',
                          style: TextStyle(
                            fontFamily: 'NanumPenScript',
                            fontSize: 24,
                          )
                      )
                  ),
                  SizedBox(
                    width: screenWidth*0.9,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(39.0)
                        ),
                        filled: true,
                        fillColor: Color(0xFFD9D9D9),
                        hintText: 'Enter your password',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  TextButton(
                    onPressed: (){},
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 60, right:60),
                        primary: Colors.white,
                        backgroundColor: Color(0xFF006C6C),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(46))),
                        textStyle: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NanumPenScript',
                          fontStyle: FontStyle.normal,
                        )
                    ),
                    child: Text('Next'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: new InkWell(
                      //wait to insert the login page
                      onTap: (){},
                        child: new Text('Already have an account? Sign In',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'NanumPenScript',
                              color: Colors.black,
                            ),
                        ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}