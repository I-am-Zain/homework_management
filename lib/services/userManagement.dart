
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthHelper {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static signInWithEmail({String email, String password}) async {
    final res = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    final User user = res.user;
    return user;

  }

  static signupWithEmail({String email, String password}) async {
   final res = await _auth.createUserWithEmailAndPassword(email: email, password: password);
   final User user = res.user;
   return user;
  }


  static logOut() {
    return _auth.signOut();

  }
}

class UserHelper {
  static FirebaseFirestore _db = FirebaseFirestore.instance;

  static saveUser(User user) async {


    Map<String, dynamic> userData = {

      "name": user.displayName,
      "email": user.email,
      "phone":user.phoneNumber,
      "last_login": user.metadata.lastSignInTime.millisecondsSinceEpoch,
      "created_at": user.metadata.creationTime.millisecondsSinceEpoch,
      "role": "user",

    };
    final userRef = _db.collection("users").doc(user.uid);
    if ((await userRef.get()).exists) {
      await userRef.update({
        "last_login": user.metadata.lastSignInTime.millisecondsSinceEpoch,

      });
    } else {
      await _db.collection("users").doc(user.uid).set(userData);
    }

  }


}

