import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:homework/mainFile/homeWorkMain.dart';

class LoginTextWidget extends StatelessWidget {
  const LoginTextWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(243.0, 526.0, 66.0, 36.0),
      size: Size(375.0, 812.0),
      fixedWidth: true,
      fixedHeight: true,
      child: Center(
        child: Text(
          'Login',
          style: TextStyle(
            fontFamily: 'Perpetua',
            fontSize: 32,
            color: const Color(0xffffffff),
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
class ExitTextWidget extends StatelessWidget {
  const ExitTextWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(76.0, 526.0, 66.0, 36.0),
      size: Size(375.0, 812.0),
      fixedWidth: true,
      fixedHeight: true,
      child: Center(
        child: Text(
          'Exit',
          style: TextStyle(
            fontFamily: 'Perpetua',
            fontSize: 32,
            color: const Color(0xffffffff),
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class Exit_button extends StatelessWidget {
  const Exit_button({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(26.0, 517.0, 162.0, 53.0),
      size: Size(375.0, 812.0),
      pinLeft: true,
      fixedWidth: true,
      fixedHeight: true,
      child: FlatButton(
        onPressed: (){
          //auth.signInWithEmailAndPassword(email: email, password: password).then((value) => );//navigator link);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => homeWorkMain(),
            ),);

        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27.0),
            color: const Color(0xffdf3434),
            border: Border.all(width: 1.0, color: const Color(0xfffefefe)),
          ),
        ),
      ),
    );
  }
}