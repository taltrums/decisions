import 'package:decisionsapp/pages/signinpage.dart';
import 'package:decisionsapp/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignOutPage extends StatefulWidget {
  const SignOutPage({super.key});

  @override
  State<SignOutPage> createState() => _SignOutPageState();
}

class _SignOutPageState extends State<SignOutPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 0),
      width: MediaQuery.of(context).size.width,
      height: 50,
      alignment: Alignment.center,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueAccent[300]),
          ),
          onPressed: () {
            //sign out
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Authentication.signout(context: context);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()));
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign out',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ],
          )),
    );
  }
}
