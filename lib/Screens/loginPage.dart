import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_game/Screens/homeLogged.dart';
import 'package:flutter_snake_game/Screens/snakeName.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../models/profile.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  double screenWidth;
  double screenHeight;

  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: firebase,
        builder: (context ,snapshot){
          if(snapshot.hasError){
            return Scaffold(
              appBar: AppBar(title: Text("Error"),),
              body: Center(child: Text("${snapshot.error}"),),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            return  Scaffold(
              resizeToAvoidBottomInset: true,
              body: Container(
                child: SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: screenHeight*0.05,
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
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: <Widget>[
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
                                        child: TextFormField(
                                          validator: MultiValidator([
                                            RequiredValidator(errorText: 'Please enter an email'),
                                            EmailValidator(errorText: 'An email address must contain a single @ and the domain'),
                                          ]),
                                          keyboardType: TextInputType.emailAddress,
                                          onSaved: (String email){
                                            profile.email = email;
                                            profile.setEmail(email);
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
                                        margin: EdgeInsets.only(top:screenHeight*0.04) ,
                                        child: TextButton(
                                          onPressed: () async{
                                            if(formKey.currentState.validate()){
                                              formKey.currentState.save();
                                              try{
                                                await FirebaseAuth.instance.signInWithEmailAndPassword(
                                                    email: profile.email, password: profile.password
                                                ).then((value){
                                                  CherryToast.success(
                                                    title: Text('Successfully logged in',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                        )
                                                    ),
                                                    description: Text('Welcome!'),
                                                    animationType: AnimationType.fromRight,
                                                    animationDuration: Duration(milliseconds: 1000),
                                                    autoDismiss: false,
                                                  ).show(context);

                                                  formKey.currentState.reset();
                                                  Future.delayed(Duration(milliseconds: 2500),(){
                                                    Navigator.pushReplacement(
                                                      context,
                                                      // MaterialPageRoute(builder: (context) => HomeLogged()),
                                                      MaterialPageRoute(builder: (context) => SnakeName()),
                                                    );
                                                  });
                                                });
                                              } on FirebaseAuthException catch(e){
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
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
