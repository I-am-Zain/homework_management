import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:homework/reFactor/HeadingData.dart';

import 'package:homework/reFactor/backGroundimage.dart';
import 'package:homework/reFactor/backgroundcolor.dart';
import 'package:homework/reFactor/logout_.dart';

import '../constants.dart';
import 'historyOfTeachers.dart';

// ignore: camel_case_types
class historyOfStudents extends StatelessWidget {
  historyOfStudents({
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
            child: studentDisplayFunction(),
          ),
          pageTitleText(
            text: Text("Student History", style: txtColor,
            ),//admin login txt
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(15.0, 739.0, 142.0, 53.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinBottom: true,
            fixedWidth: true,
            fixedHeight: true,
            child: FlatButton(
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new historyOfTeachers()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: const Color(0xffdf3434),
                  border: Border.all(width: 1.0, color: const Color(0xfffbebeb)),
                ),
              ),
            ),
          ),//red button
          Pinned.fromSize(
            bounds: Rect.fromLTWH(34.0, 746.0, 105.0, 40.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinBottom: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Center(
              child: Text(
                'Teacher history',
                style: TextStyle(
                  fontFamily: 'Perpetua',
                  fontSize: 22,
                  color: const Color(0xff010103),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),//red buton txt


          logoutShape(),//logout shape
          logout_Icon(),//logout icon
          logout_text(),//logout text
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class studentDisplayFunction extends StatelessWidget {
  const studentDisplayFunction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
    stream: FirebaseFirestore.instance.collection('users').snapshots(),
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
              color: Colors.purple[300],
                child:Card(
                  color: Colors.blue[200],
                  elevation: 10.0,
                  child: ListTile(

                    leading: Icon(Icons.person),
                    title: Text("${users['name']}    FA17-BSE-${users['registration']}", style: TextStyle(fontSize: 24),),
                    subtitle: Text("${users['email']}",style: TextStyle(fontSize: 20)),
                    onLongPress: (){
                      FirebaseFirestore.instance.collection("users").doc(users.id).delete();
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
    );
  }
}
