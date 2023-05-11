import 'package:decisionsapp/pages/dashboardpage.dart';
import 'package:decisionsapp/pages/homepage.dart';
import 'package:decisionsapp/pages/verifypage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  static Future<void> signinWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashboardPage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          //handle error
          print('account exist with different credential');
        } else if (e.code == 'invalid-credential') {
          //handle error
          print('invalid credential');
        }
      } catch (e) {
        //handle error
        print('something else');
      }
    }
  }

  static void signin(BuildContext context, String email, String password) {
    final auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(email: email, password: password).then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DashboardPage()));
    });
  }

  static void resetPassword(BuildContext context, String email) {
    final auth = FirebaseAuth.instance;
    auth.sendPasswordResetEmail(email: email);
    //reset
  }

  static Future<void> signout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
  }

  static void register(BuildContext context, String email, String password) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => VerifyPage()));
    });
  }
}
