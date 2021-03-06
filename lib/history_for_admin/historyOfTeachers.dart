import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homework/mainFile/homeWorkMain.dart';

import 'package:homework/reFactor/HeadingData.dart';

import 'package:homework/reFactor/backGroundimage.dart';
import 'package:homework/reFactor/backgroundcolor.dart';
import 'package:homework/reFactor/logout_.dart';

import '../constants.dart';


// ignore: camel_case_types
class historyOfTeachers extends StatelessWidget {
  final auth=FirebaseAuth.instance;
  historyOfTeachers({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          background_image(),
          background_color_gradient(),
          headWidget(),
          headText(),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(10.0, 174.0, 355.0, 615.0),
            size: Size(375.0, 795.0),
            pinLeft: true,
            pinRight: true,
            pinBottom: true,
            fixedHeight: true,
            child: Container(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('teachers').snapshots(),
                  builder:
                      (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context,index){
                        DocumentSnapshot users=snapshot.data.documents[index];
                        return Container(
                            color: Colors.blue[300],
                            child:Card(
                              color: Colors.purple[200],
                              elevation: 10.0,
                              child: ListTile(

                                leading: Icon(Icons.person),
                                title: Text("${users['Name']}      Email:${users['Email']}", style: TextStyle(fontSize: 24),),
                                subtitle: Text("Designation: ${users['Designation']}",style: TextStyle(fontSize: 20)),
                                onLongPress: (){
                                  FirebaseFirestore.instance.collection("teachers").doc(users.id).delete();
                                  Fluttertoast.showToast(
                                      msg: "Deleted successfully",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.SNACKBAR,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.blue,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                },
                              ),
                            )
                        );
                      },
                    );
                  }),
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(14.0),
                color: const Color(0xdee3e5e9),
                border: Border.all(width: 1.0, color: const Color(0xdef6f6f6)),
              ),
            ),
          ),
          pageTitleText(
            text: Text("Teacher History", style: txtColor,
            ),//admin login txt
          ),
          logoutShape(),
          logout_Icon(),
          logout_text(),
        ],
      ),
    );
  }
}

