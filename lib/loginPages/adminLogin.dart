import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homework/add_details/addTeacherStudent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homework/constants.dart';
import 'package:homework/reFactor/HeadingData.dart';
import 'package:homework/reFactor/backgroundcolor.dart';
import 'package:homework/reFactor/loginAndExitText.dart';
import 'package:homework/services/validator.dart';
import '../reFactor/backGroundimage.dart';

// ignore: camel_case_types
class adminLogin extends StatefulWidget {
  adminLogin({Key key}):super(key:key);
  @override
  _adminLoginState createState() => _adminLoginState();
}

// ignore: camel_case_types
class _adminLoginState extends State<adminLogin> {
  String uid;

  final GlobalKey<FormState> _adminLogin=GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  TextEditingController email_Controller;
  TextEditingController passwordController;
  final auth=FirebaseAuth.instance;
  User user;
  @override
  initState(){
    email_Controller =new TextEditingController();
    passwordController=new TextEditingController();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        child: Form(
          key: _adminLogin,
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
                    controller: email_Controller,
                    validator: emailValidator,
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
                        icon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        labelText: "Password"
                    ),
                    controller: passwordController,
                    validator: pwdValidator,
                  ),
                ),

              ),//password
              pageTitleText(
                text: Text("Admin Login", style: txtColor,
              ),//admin login txt
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(203.0, 517.0, 146.0, 53.0),
                size: Size(375.0, 812.0),
                pinRight: true,
                fixedWidth: true,
                fixedHeight: true,
                child: FlatButton(
                  onPressed: (){
                    if(_adminLogin.currentState.validate()){
                      FirebaseAuth.instance.signInWithEmailAndPassword(email: email_Controller.text, password: passwordController.text)
                          .then((currentUser) => FirebaseFirestore.instance.collection("users")
                          .doc(uid).get()
                          .then((DocumentSnapshot result) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>addTeacherStudent()),

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