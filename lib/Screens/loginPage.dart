import 'package:flutter/material.dart';
import 'package:flutter_snake_game/Screens/homeLogged.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  double screenWidth;
  double screenHeight;
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        child: Container(
          child: Form(
            child: Container(
              child: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        child : IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back,size: 46,
                          ),
                          color: Color(0xFF006C6C),
                        )
                    ),
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image(
                                image: AssetImage('assets/images/snakie_login.png')
                            ),
                            Container(
                              margin: EdgeInsets.only(top:screenHeight*0.05),
                              child: Text('Welcome Back!',
                                style: TextStyle(
                                  fontFamily: 'NanumPenScript',
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:screenHeight*0.01),
                              child: Text('Your Snakie is waiting for you',
                                style: TextStyle(
                                  fontFamily: 'NanumPenScript',
                                  fontSize: 18,
                                  color: Color(0xFF434343),
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left:screenWidth*0.1,top:screenHeight*0.04) ,
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
                              width: screenWidth*0.8,
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
                                margin: EdgeInsets.only(left:screenWidth*0.1,top:screenHeight*0.04) ,
                                alignment: Alignment.topLeft,
                                child: Text('Password',
                                    style: TextStyle(
                                      fontFamily: 'NanumPenScript',
                                      fontSize: 24,
                                    )
                                )
                            ),
                            SizedBox(
                              width: screenWidth*0.8,
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
                              margin: EdgeInsets.only(top:screenHeight*0.04) ,
                              child: TextButton(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomeLogged()),
                                  );
                                },
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
