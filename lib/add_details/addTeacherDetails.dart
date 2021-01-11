import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homework/history_for_admin/historyOfTeachers.dart';

import 'package:homework/mainFile/homeWorkMain.dart';
import 'package:homework/panels/teacherPanel.dart';
import 'package:homework/reFactor/HeadingData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homework/reFactor/backGroundimage.dart';
import 'package:homework/reFactor/backgroundcolor.dart';
import 'package:homework/services/validator.dart';
// ignore: camel_case_types
class addTeacherDetails extends StatefulWidget {
  addTeacherDetails({
    Key key,
  }) : super(key: key);
  @override
  _addTeacherDetailsState createState() => _addTeacherDetailsState();
}

// ignore: camel_case_types
class _addTeacherDetailsState extends State<addTeacherDetails> {
  final auth=FirebaseAuth.instance;
  String tName;
  String tEmail;
  String tPassword;
  String tDesignation;
  String uid;
  final GlobalKey<FormState>globalKey=GlobalKey<FormState>();
  TextEditingController nameTControl;
  TextEditingController emailTControl;
  TextEditingController passwordTControl;
  TextEditingController designationTControl;
  @override
  initState(){
    nameTControl =new TextEditingController();
    emailTControl=new TextEditingController();
    passwordTControl=new TextEditingController();
    designationTControl=new TextEditingController();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(

        child: Form(
          key: globalKey,
          child: Stack(
            children: <Widget>[
              background_image(),
              background_color_gradient(),
              pageTitleText(
                text: Text("Teacher Details", style: TextStyle(fontFamily: 'Rockwell',
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
                    if(globalKey.currentState.validate()){
                      FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailTControl.text, password: passwordTControl.text)
                          .then((currentUser) => FirebaseFirestore.instance.collection("teachers")
                          .doc(uid)
                          .set({
                        "Name": nameTControl.text,
                        "Email": emailTControl.text,
                        "Password": passwordTControl.text,
                        "Designation" : designationTControl.text,
                        "role":"teacher",
                      }).then((result) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>historyOfTeachers()),
                      ),));
                      Fluttertoast.showToast(
                          msg: "Teacher Added",
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
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27.0),
                        color: const Color(0xff4858e9),
                        border: Border.all(width: 1.0, color: const Color(0xfffefefe)),
                      ),
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
                    controller: nameTControl,
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
                    controller: emailTControl,
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
                    controller: passwordTControl,
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
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.text_fields),
                        labelText: "Designation"
                    ),
                    controller: designationTControl,

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



