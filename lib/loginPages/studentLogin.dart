import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:homework/panels/studentPanel.dart';
import 'package:homework/reFactor/HeadingData.dart';

import 'package:homework/reFactor/backgroundcolor.dart';
import 'package:homework/reFactor/loginAndExitText.dart';

import 'package:homework/services/validator.dart';

import '../constants.dart';
import '../reFactor/backGroundimage.dart';

// ignore: camel_case_types
class studentLogin extends StatefulWidget {
  @override
  _studentLoginState createState() => _studentLoginState();
}

// ignore: camel_case_types
class _studentLoginState extends State<studentLogin> {
  String uid;
  final GlobalKey<FormState> _studentLogin=GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  TextEditingController Semail_Controller;
  // ignore: non_constant_identifier_names
  TextEditingController SpasswordController;
  final auth=FirebaseAuth.instance;
  @override
  initState(){
    Semail_Controller =new TextEditingController();
    SpasswordController=new TextEditingController();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        child: Form(
          key: _studentLogin,
          child: Stack(
            children: <Widget>[
              background_image(),
              background_color_gradient(),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(10.0, 250.0, 355.0, 58.0),
                size: Size(375.0, 812.0),//Registration
                pinLeft: true,
                pinRight: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(14.0),
                    boxShadow: shadow,
                    color: const Color(0xdee3e5e9),
                    border: Border.all(width: 1.0, color: const Color(0xdef6f6f6)),
                  ),
                  child:TextFormField(

                    decoration: InputDecoration(
                        icon: Icon(Icons.email,),
                        border: OutlineInputBorder(),
                        labelText: "Email"
                    ),
                    validator: emailValidator,
                    controller: Semail_Controller,
                  ),
                ),

              ),//Email
              Pinned.fromSize(
                bounds: Rect.fromLTWH(10.0, 358.0, 355.0, 58.0),
                size: Size(375.0, 812.0), //paswd
                pinLeft: true,
                pinRight: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(14.0),
                    boxShadow: shadow,
                    color: const Color(0xdee3e5e9),
                    border: Border.all(width: 1.0, color: const Color(0xdef6f6f6)),
                  ),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock,),
                        border: OutlineInputBorder(),
                        labelText: "Password"
                    ),
                    validator: pwdValidator,
                    controller: SpasswordController,
                  ),
                ),

              ),//password
              pageTitleText(
                text: Text("Student Login", style: TextStyle(fontFamily: 'Rockwell',
                  fontSize: 43,
                  color: const Color(0xff2e2e31),
                  fontWeight: FontWeight.w700,),),
              ),//student login
              Pinned.fromSize(
                bounds: Rect.fromLTWH(203.0, 517.0, 146.0, 53.0),
                size: Size(375.0, 812.0),
                pinRight: true,
                fixedWidth: true,
                fixedHeight: true,
                child: FlatButton(
                    onPressed: (){
                      if(_studentLogin.currentState.validate()){
                        FirebaseAuth.instance.signInWithEmailAndPassword(email: Semail_Controller.text, password: SpasswordController.text)
                            .then((currentUser) => FirebaseFirestore.instance.collection("users")
                            .doc(uid).get()
                            .then((DocumentSnapshot result) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>studentPanel()),
                        ),));
                        Fluttertoast.showToast(
                            msg: "successfully Logged In",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                      else{
                        showDialog(context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text("Please Enter data"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
                  // onPressed: (){
                  //   auth.signInWithEmailAndPassword(email: email, password: password).then((User) =>Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => studentPanel(),
                  //     ),) );//navigator link);
                  //
                  //
                  // },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27.0),
                      color: const Color(0xff4858e9),
                      border: Border.all(width: 1.0, color: const Color(0xfffefefe)),
                    ),
                  ),
                ),
              ),//login button
              Exit_button(),//exit button


              ExitTextWidget(),
              LoginTextWidget(),
              headWidget(),
              headText(),
            ],
          ),
        ),
      ),
    );
  }
}








