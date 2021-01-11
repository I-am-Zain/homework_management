import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:homework/add_details/addTeacherDetails.dart';
import 'package:homework/history_for_admin/historyOfStudents.dart';
import 'package:homework/mainFile/homeWorkMain.dart';
import 'package:homework/reFactor/HeadingData.dart';
import 'package:homework/reFactor/backGroundimage.dart';
import 'package:homework/reFactor/backgroundcolor.dart';

import '../constants.dart';
import 'addStudentDetails.dart';

// ignore: camel_case_types
class addTeacherStudent extends StatefulWidget {
  addTeacherStudent({
    Key key,
  }) : super(key: key);

  @override
  _addTeacherStudentState createState() => _addTeacherStudentState();
}

class _addTeacherStudentState extends State<addTeacherStudent> {
  User user;
  final auth=FirebaseAuth.instance;
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
            bounds: Rect.fromLTWH(91.0, 253.0, 193.0, 171.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child: FlatButton(
              onPressed: () {Navigator.push(context, new MaterialPageRoute(builder: (context) => new addTeacherDetails())); },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xffe3e5e9),
                  //border: Border.all(width: 1.0, color: const Color(0xff707070)),
                    boxShadow: shadow,
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(91.0, 444.0, 193.0, 171.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child: FlatButton(
              onPressed: () {Navigator.push(context, new MaterialPageRoute(builder: (context) => new addStudentDetails())); },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xffe3e5e9),
                  //border: Border.all(width: 1.0, color: const Color(0xff707070)),
                  boxShadow: shadow,
                ),
              ),
            ),

          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(140.0, 265.0, 95.0, 95.0),
            size: Size(375.0, 812.0),
            fixedWidth: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'instructor-lecture-…' (shape)
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                image: DecorationImage(
                  image: const AssetImage('assets/teachericon.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(140.0, 460.0, 95.0, 95.0),
            size: Size(375.0, 812.0),
            fixedWidth: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'reading-book' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/studenticon.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(146.0, 358.0, 90.0, 66.0),
            size: Size(375.0, 812.0),
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              'Add\nTeacher',
              style: TextStyle(
                fontFamily: 'Poor Richard',
                fontSize: 30,
                color: const Color(0xff2e2e31),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(144.0, 549.0, 88.0, 66.0),
            size: Size(375.0, 812.0),
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              'Add\nStudent',
              style: TextStyle(
                fontFamily: 'Poor Richard',
                fontSize: 30,
                color: const Color(0xff2e2e31),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          pageTitleText(
            text: Text("Admin", style: txtColor),
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
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new historyOfStudents()));
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
                'view history',
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
          ),
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
          ),
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
          ),
        ],
      ),
    );
  }
}
