

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:homework/history_for_admin/historyOfStudents.dart';
import 'package:homework/panels/studentPanel.dart';
import 'package:homework/panels/teacherPanel.dart';
import 'package:homework/pdf/pdf.dart';


import 'package:homework/reFactor/HeadingData.dart';
import '../constants.dart';
import 'file:///C:/Users/zayne/AndroidStudioProjects/homework/lib/loginPages/adminLogin.dart';
import 'file:///C:/Users/zayne/AndroidStudioProjects/homework/lib/loginPages/studentLogin.dart';
import 'file:///C:/Users/zayne/AndroidStudioProjects/homework/lib/loginPages/teacherLogin.dart';
import 'package:homework/reFactor/backGroundimage.dart';
import 'package:homework/reFactor/backgroundcolor.dart';




// ignore: camel_case_types
class homeWorkMain extends StatelessWidget {
  homeWorkMain({
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
          Pinned.fromSize(
            bounds: Rect.fromLTWH(27.0, 115.0, 322.0, 69.0),
            size: Size(375.0, 812.0), //Admin Button
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            fixedHeight: true,
              child: FlatButton(
                onPressed: () {Navigator.push(context, new MaterialPageRoute(builder: (context) => new adminLogin())); },//adminLogin VideoScreen
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    color: const Color(0xffe3e5e9),
                    boxShadow: shadow,
                    border: Border.all(width: 1.0, color: const Color(0xfff6f6f6)),
                  ),
                ),
              ),

          ),//admin Button
          Pinned.fromSize(
            bounds: Rect.fromLTWH(27.0, 205.0, 322.0, 69.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child: FlatButton(
              onPressed: () {Navigator.push(context, new MaterialPageRoute(builder: (context) => new teacherLogin())); },//teacherLogin
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: const Color(0xffe3e5e9),
                  boxShadow: shadow,
                  border: Border.all(width: 1.0, color: const Color(0xfff6f6f6)),
                ),
              ),

            ),
          ),//teacher Button
          Pinned.fromSize(
            bounds: Rect.fromLTWH(27.0, 290.0, 322.0, 69.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,

                child: FlatButton(
                  onPressed: () {Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentLogin())); },//studentLogin
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: const Color(0xffe3e5e9),
                      boxShadow: shadow,
                      border: Border.all(width: 1.0, color: const Color(0xfff6f6f6)),
                    ),
                  ),
                ),


          ),//student button
          headText(),//homework MGT txt
          Pinned.fromSize(
            bounds: Rect.fromLTWH(57.0, 124.0, 54.0, 54.0),
            size: Size(375.0, 812.0),
            fixedWidth: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'admin-with-cogwheels' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/adminicon.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(57.0, 213.0, 54.0, 54.0),
            size: Size(375.0, 812.0),
            fixedWidth: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'instructor-lecture-…' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/teachericon.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(57.0, 302.0, 54.0, 54.0),
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
            bounds: Rect.fromLTWH(155.0, 132.0, 105.0, 37.0),
            size: Size(375.0, 812.0),
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              'Admin',
              style: TextStyle(
                fontFamily: 'Rockwell',
                fontSize: 32,
                color: const Color(0xff2e2e31),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(155.0, 221.0, 129.0, 37.0),
            size: Size(375.0, 812.0),
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              'Teacher',
              style: TextStyle(
                fontFamily: 'Rockwell',
                fontSize: 32,
                color: const Color(0xff2e2e31),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(155.0, 310.0, 117.0, 37.0),
            size: Size(375.0, 812.0),
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              'Student',
              style: TextStyle(
                fontFamily: 'Rockwell',
                fontSize: 32,
                color: const Color(0xff2e2e31),
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




