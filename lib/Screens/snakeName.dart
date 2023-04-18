import 'package:flutter/material.dart';
import '../models/profile.dart';
import 'homeLogged.dart';

class SnakeName extends StatefulWidget {
  @override
  _SnakeNameState createState() => _SnakeNameState();

}

class _SnakeNameState extends State<SnakeName>{
  Profile profile = Profile();
  final myController = TextEditingController(); // Define the controller here

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  double screenWidth;
  double screenHeight;
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: screenHeight*0.1,
              left: screenWidth*0.1,
              child: Container(
                child: Text(
                  'Welcome!',
                  style: TextStyle(
                    fontFamily: 'NanumPenScript',
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF006C6C),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: screenHeight*0.25),
                        child : Image(image: AssetImage(
                            'assets/images/snakie_circle.png'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: screenHeight*0.05),
                        child: Text("What's your snakie name?",
                          style: TextStyle(
                            fontFamily: 'NanumPenScript',
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth*0.6,
                        child: TextField(
                          maxLength: 10,
                          controller: myController,
                          decoration: InputDecoration(
                            hintText: 'eg. Snakiekie',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: screenHeight*0.05),
                      ),
                      TextButton(
                        onPressed: () {
                          profile.setName(myController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeLogged()),
                          );
                        },
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.only(left: 60, right:60),
                            foregroundColor: Colors.white,
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
                    ],
                  )
              ),
            ),
          ],
        )
    );
  }
}
