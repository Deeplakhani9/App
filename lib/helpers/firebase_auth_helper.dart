import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  FirebaseAuthHelper._();
  static final FirebaseAuthHelper firebaseAuthHelper = FirebaseAuthHelper._();

  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;


  Future<Map<String, dynamic>> logInWithAnonymously() async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await firebaseAuth.signInAnonymously();

      User? user = userCredential.user;

      res['user'] = user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          res['error'] = "This service is temporary down...";
          break;
      }
    }

    return res;
  }

  Future<Map<String, dynamic>> signUp(
      {required String email, required String password}) async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      res['user'] = user;
    } on FirebaseAuthException catch (e) {
      print("========================");
      print(e.code);
      print("========================");
      switch (e.code) {
        case "operation-not-allowed":
          res['error'] = "This service is temporay down...";
          break;
        case "weak-password":
          res['error'] = "Password must be lengthy...";
          break;
        case "email-already-in-use":
          res['error'] = "This user already exists...";
          break;
      }
    }

    return res;
  }

  Future<Map<String, dynamic>> signIn(
      {required String email, required String password}) async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      res['user'] = user;
    } on FirebaseAuthException catch (e) {
      print("=====================");
      print(e.code);
      print("=====================");
      switch (e.code) {
        case "wrong-password":
          res['error'] = "Password is wrong...";
          break;
        case "operation-not-allowed":
          res['error'] = "Sign in method is disabled...";
          break;
        case "user-disabled":
          res['error'] = "You are blocked...";
          break;
      }
    }

    return res;
  }
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }
}
