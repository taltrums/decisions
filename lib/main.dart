import 'package:decisionsapp/pages/signinpage.dart';
import 'package:decisionsapp/utils/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Authentication.initializeFirebase();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Authentication.initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(
              'Something went wrong',
              textDirection: TextDirection.ltr,
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Decisions App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const LoginPage(),
            );
          }
          return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange));
        });
  }
}
