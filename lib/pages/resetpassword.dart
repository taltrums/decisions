import 'package:decisionsapp/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late String _email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Container(
            width: 200,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Authentication.resetPassword(context, _email);
                  Fluttertoast.showToast(
                    msg: "A reset email has been sent to you", // message
                    toastLength: Toast.LENGTH_SHORT, // length
                    gravity: ToastGravity.CENTER, // location

                    timeInSecForIosWeb: 2,
                  );
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Request Reset',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
