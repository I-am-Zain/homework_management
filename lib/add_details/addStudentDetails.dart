//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homework/history_for_admin/historyOfStudents.dart';
import 'package:homework/mainFile/homeWorkMain.dart';
import 'package:homework/panels/studentPanel.dart';

import 'package:homework/reFactor/HeadingData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homework/reFactor/backGroundimage.dart';
import 'package:homework/reFactor/backgroundcolor.dart';
//import 'package:homework/services/userManagement.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:homework/services/userManagement.dart';
import 'package:homework/services/validator.dart';
// ignore: camel_case_types, must_be_immutable
class addStudentDetails extends StatefulWidget {

  addStudentDetails({Key key}) : super(key: key);
  //final String uid;
  @override
  _addStudentDetailsState createState() => _addStudentDetailsState();
}

// ignore: camel_case_types
class _addStudentDetailsState extends State<addStudentDetails> {
  // String email;
  // String password;
  // String Sname;
   String uid ;
   User user;
  final auth=FirebaseAuth.instance;

  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  TextEditingController nameControl;
  TextEditingController emailControl;
  TextEditingController passwordControl;
  TextEditingController registratoinControl;
  @override
  initState(){
    nameControl =new TextEditingController();
    emailControl=new TextEditingController();
    passwordControl=new TextEditingController();
    registratoinControl=new TextEditingController();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(

          child: Form(
            key: _globalKey,
            child: Stack(
              children: <Widget>[
                background_image(),
                background_color_gradient(),
                pageTitleText(
                  text: Text("Student Details", style: TextStyle(fontFamily: 'Rockwell',
                    fontSize: 43,
                    color: const Color(0xff2e2e31),
                    fontWeight: FontWeight.w700,),),
                ),

                Pinned.fromSize(
                  bounds: Rect.fromLTWH(203.0, 514.0, 146.0, 53.0),
                  size: Size(375.0, 812.0),
                  pinRight: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: FlatButton(
                    onPressed: (){
                      if(_globalKey.currentState.validate()){
                        FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailControl.text, password: passwordControl.text)
                            .then((currentUser) => FirebaseFirestore.instance.collection("users")
                        .doc(uid)
                        .set({
                          "name": nameControl.text,
                          "email": emailControl.text,
                          "password": passwordControl.text,
                          "registration" : registratoinControl.text,
                          "role":"user",
                        }).then((result) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>historyOfStudents()),
                        ),));
                        Fluttertoast.showToast(
                            msg: "Student Added",
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
                ),//add button shape

                Pinned.fromSize(
                  bounds: Rect.fromLTWH(252.0, 523.0, 48.0, 36.0),
                  size: Size(375.0, 812.0),
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontFamily: 'Perpetua',
                      fontSize: 32,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),//add txt
                headWidget(),
                headText(),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(20.0, 261.0, 335.0, 38.0),
                  size: Size(375.0, 812.0),
                  pinLeft: true,
                  pinRight: true,
                  fixedHeight: true,
                  child: Container(
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(19.0),
                      color: const Color(0xffc1ddf5),
                      border: Border.all(width: 1.0, color: const Color(0xff707070)),
                    ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        labelText: "Name"
                    ),
                    controller: nameControl,
                    validator: nameValidator,
                  ),
                  ),
                ),//name shape
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(20.0, 319.0, 335.0, 38.0),
                  size: Size(375.0, 812.0),
                  pinLeft: true,
                  pinRight: true,
                  fixedHeight: true,
                  child: Container(
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(19.0),
                      color: const Color(0xffc1ddf5),
                      border: Border.all(width: 1.0, color: const Color(0xff707070)),
                    ),
                    child:TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                          labelText: "Email"
                      ),
                      controller: emailControl,
                      keyboardType: TextInputType.emailAddress,
                      validator: emailValidator,

                    ),
                  ),
                ),//email shape
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(20.0, 377.0, 335.0, 38.0),
                  size: Size(375.0, 812.0),
                  pinLeft: true,
                  pinRight: true,
                  fixedHeight: true,
                  child: Container(
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(19.0),
                      color: const Color(0xffc1ddf5),
                      border: Border.all(width: 1.0, color: const Color(0xff707070)),
                    ),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                          labelText: "Password"
                      ),
                      controller: passwordControl,
                      validator: pwdValidator,
                    ),
                  ),
                ),//paswd shae
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(20.0, 435.0, 335.0, 38.0),
                  size: Size(375.0, 812.0),
                  pinLeft: true,
                  pinRight: true,
                  fixedHeight: true,
                  child: Container(
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(19.0),
                      color: const Color(0xffc1ddf5),
                      border: Border.all(width: 1.0, color: const Color(0xff707070)),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.app_registration),
                          border: OutlineInputBorder(),
                          labelText: "Reg#"
                      ),
                      controller: registratoinControl,

                    ),
                  ),
                ),//reg




                Pinned.fromSize(
                  bounds: Rect.fromLTWH(180.0, 731.0, 165.0, 57.0),
                  size: Size(375.0, 812.0),
                  pinRight: true,
                  pinBottom: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: FlatButton(
                    onPressed: (){
                      auth.signOut().then((user) =>Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => homeWorkMain(),
                        ),) );//navigator link);


                    },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29.0),
                      color: const Color(0xffe2bfbf),
                      border: Border.all(width: 1.0, color: const Color(0xff707070)),
                    ),
                  ),
                  ),
                ),//logout
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(291.0, 740.0, 40.0, 40.0),
                  size: Size(375.0, 812.0),
                  pinRight: true,
                  pinBottom: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'log-out' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/logout.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),//logout shape
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(201.0, 745.0, 70.0, 29.0),
                  size: Size(375.0, 812.0),
                  pinBottom: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontFamily: 'Perpetua',
                      fontSize: 26,
                      color: const Color(0xff010103),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),//logout text
              ],
            ),
          ),

      ),
    );
  }
}

