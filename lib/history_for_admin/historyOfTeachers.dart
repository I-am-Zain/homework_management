import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homework/mainFile/homeWorkMain.dart';

import 'package:homework/reFactor/HeadingData.dart';

import 'package:homework/reFactor/backGroundimage.dart';
import 'package:homework/reFactor/backgroundcolor.dart';

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



          Pinned.fromSize(
            bounds: Rect.fromLTWH(175.0, 742.0, 163.0, 50.0),
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
          ),//logout buton
          Pinned.fromSize(
            bounds: Rect.fromLTWH(280.0, 751.0, 40.0, 40.0),
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
          ),//logout icon
          Pinned.fromSize(
            bounds: Rect.fromLTWH(194.0, 753.0, 70.0, 29.0),
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
          ),//logout txt
        ],
      ),
    );
  }
}

