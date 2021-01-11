import 'package:flutter/material.dart';
import 'package:adobe_xd/adobe_xd.dart';

import '../constants.dart';
// ignore: camel_case_types
class headText extends StatelessWidget {
  const headText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(33.0, 47.0, 322.0, 38.0),
      size: Size(375.0, 812.0),
      pinLeft: true,
      pinRight: true,
      pinTop: true,
      fixedHeight: true,
      child: Center(
        child: Text(
          'Homework Management ',
          style: TextStyle(
            fontFamily: 'Script MT',
            fontSize: 32,
            color: const Color(0xff1e11d5),
            fontWeight: FontWeight.w700,
          ),

        ),
      ),
    );
  }
}

// ignore: camel_case_types
class headWidget extends StatelessWidget {
  const headWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(10.0, 35.0, 355.0, 69.0),
      size: Size(375.0, 812.0),
      pinLeft: true,
      pinRight: true,
      pinTop: true,
      fixedHeight: true,
      child: Container(

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(13.0),
          color: const Color(0xffe3e5e9),

          border: Border.all(width: 1.0, color: const Color(0xfff6f6f6)),
        ),

      ),
    );
  }
}

// ignore: camel_case_types
class pageTitleText extends StatelessWidget {
  pageTitleText({@required this.text});
  final Widget text;
  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(51.0, 110.0, 274.0, 51.0),
      size: Size(375.0, 812.0),
      pinLeft: true,
      pinRight: true,
      fixedHeight: true,
      child: Center(
        child: text,

      ),
      //textAlign: TextAlign.left,
    );


  }

}
