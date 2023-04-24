import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_game/Screens/home.dart';
import 'package:flutter_snake_game/Screens/homeLogged.dart';
import 'package:flutter_snake_game/Screens/loginPage.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../models/profile.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{

  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  double screenWidth;
  double screenHeight;
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder (
      future: firebase,
        builder: (context ,snapshot){
        if(snapshot.hasError){
          return Scaffold(
            appBar: AppBar(title: Text("Error"),),
            body: Center(child: Text("${snapshot.error}"),),
          );
        }
        if(snapshot.connectionState == ConnectionState.done){
          return Scaffold(
            // resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xFF006C6C),
            body: Stack(
              children: <Widget>[
                Positioned(
                  top: screenHeight*0.05,
                  child : IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
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
                        SizedBox(
                          // padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                          width: screenWidth*0.9,
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(left:20) ,
                                    alignment: Alignment.topLeft,
                                    child: Text('Email',
                                        style: TextStyle(
                                          fontFamily: 'NanumPenScript',
                                          fontSize: 24,
                                        )
                                    )
                                ),
                                TextFormField(
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: 'Please enter an email'),
                                    EmailValidator(errorText: 'An email address must contain a single @ and the domain'),
                                  ]),
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (String email){
                                    profile.email = email;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(39.0)
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFD9D9D9),
                                    hintText: 'example@gmail.com',
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left:20,top:20) ,
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
                                  child: TextFormField(
                                    validator: RequiredValidator(errorText: 'Please enter password'),
                                    obscureText: true,
                                    onSaved: (String password){
                                      profile.password = password;
                                    },
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
                                  onPressed: () async{
                                    if(formKey.currentState.validate()){
                                      formKey.currentState.save();
                                      try{
                                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                            email: profile.email, password: profile.password
                                        ).then((value){
                                          CherryToast.success(
                                            title: Text('Successfully created account.',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                )
                                            ),
                                            description: Text('Welcome to Snakether!'),
                                            animationType: AnimationType.fromRight,
                                            animationDuration: Duration(milliseconds: 1000),
                                            autoDismiss: false,
                                          ).show(context);

                                          formKey.currentState.reset();
                                          Future.delayed(Duration(milliseconds: 2500),(){
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) => LoginPage()),
                                            );
                                          });
                                        }
                                        );
                                      } on FirebaseAuthException catch(e){
                                        print(e.code);
                                        print(e.message);
                                        CherryToast.error(
                                          title: Text(e.message),
                                          animationType: AnimationType.fromRight,
                                          animationDuration: Duration(milliseconds: 1000),
                                          autoDismiss: true,
                                        ).show(context);
                                      }
                                    }
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
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: new InkWell(
                            //wait to insert the login page
                            onTap: (){
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            },
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
        return Scaffold(
          body:Center(
            child: CircularProgressIndicator(),
          )
        );
      }
    );
  }
}
