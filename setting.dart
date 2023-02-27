import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_snake_game/Screens/homeLogged.dart';
class setting extends StatefulWidget {
  static Color pieceColor = Colors.blue;
  static String pieceType = 'normal';
  @override
  _settingPageState createState() => _settingPageState();

}



class _settingPageState extends State<setting> {
  @override
  double screenWidth;
  double screenHeight;
  Color _buttonColor = Colors.blue;

  void changeColor(Color color) {
    setState(() => setting.pieceColor = color);
  }

  void changeType(String type) {
    setState(() => setting.pieceType = type);
  }


  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Pick a color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _buttonColor,
              onColorChanged: (color) {
                setState(() {
                  // Update the button color with the selected color
                  _buttonColor = color;
                  changeColor(color);
                });
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showType() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Choose the snake type',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF006C6C),
            ),
          ),
          content: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child:
                  Image.asset(
                      'assets/images/snakeType_normal.png',
                    width: 60,
                    height: 60,
                  ),
                  onTap: () {
                    changeType('normal');
                    Navigator.of(context).pop();
                  },
                ),

                GestureDetector(
                  child:
                  Image.asset(
                    'assets/images/snakeType_cheese.png',
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    changeType('cheese');
                    Navigator.of(context).pop();
                  },
                ),

                GestureDetector(
                  child:
                  Image.asset(
                    'assets/images/snakeType_direction.png',
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    changeType('direction');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF006C6C),
      body: Stack(
        children: <Widget> [
          Positioned(
            top: screenHeight*0.10,
            left: screenWidth*0.1,
            child : Image(
              image: AssetImage(
                  'assets/images/Logo2 white.png'),
              width: screenWidth*0.8,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(57)
                ),
              ),
              width: screenWidth,
              height: screenHeight*0.78,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text('🐍 Setting',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NanumPenScript',
                        fontSize: 55,
                      ),
                    ),
                  ),
                  SizedBox(height:
                  screenWidth*0.05),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text('Snake',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NanumPenScript',
                        fontSize: 45,
                      ),
                    ),
                  ),
                  SizedBox(height:
                  screenWidth*0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin:EdgeInsets.fromLTRB(screenWidth*0.1,0, 0, 0),
                      child:Text('Color',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NanumPenScript',
                          fontSize: 40,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:MaterialStateProperty.all(_buttonColor),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          ),
                        ),
                        onPressed: () => _showColorPicker(),
                        child: Text('Change Color'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin:EdgeInsets.fromLTRB(screenWidth*0.1,screenHeight*0.03, 0, 0),
                        child:Text('Type',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NanumPenScript',
                            fontSize: 40,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:MaterialStateProperty.all(Color(0xFF006C6C)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          ),
                        ),
                        onPressed: () => _showType(),
                        child: Text('Change type'),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin:EdgeInsets.fromLTRB(screenWidth*0.1, screenHeight*0.03, 0, 0),
                    child: Text('Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NanumPenScript',
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin:EdgeInsets.fromLTRB(0, screenHeight*0.03, 0, 0),
                    child: Text('Game',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NanumPenScript',
                        fontSize: 45,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin:EdgeInsets.fromLTRB(screenWidth*0.1, screenHeight*0.03, 0, 0),
                    child: Text('Location',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NanumPenScript',
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  TextButton(
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
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NanumPenScript',
                          fontStyle: FontStyle.normal,
                        )
                    ),
                    child: Text('confirm'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}


