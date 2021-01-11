
import 'package:adobe_xd/adobe_xd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homework/mainFile/homeWorkMain.dart';

class logout_text extends StatelessWidget {
  const logout_text({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(190.0, 756.0, 70.0, 29.0),
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
    );
  }
}

class logout_Icon extends StatelessWidget {
  const logout_Icon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(254.0, 751.0, 40.0, 40.0),
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
    );
  }
}

class logoutShape extends StatelessWidget {

  const logoutShape({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth=FirebaseAuth.instance;
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(150.0, 742.0, 165.0, 57.0),
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
          Fluttertoast.showToast(
              msg: "Logged Out successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0
          );

        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(29.0),
            color: const Color(0xffe2bfbf),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
    );
  }
}
