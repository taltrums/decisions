import 'package:decisionsapp/utils/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late String _email, _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 10,
          backgroundColor: Colors.blueAccent[300],
          title: Text('Decisions App')),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 10, right: 10),
        child: Column(
          children: [
            Center(
              child: Text(
                'Registration',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  hintText: "example@gmail.com",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)))),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)))),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.only(bottom: 0),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent[300]),
                  ),
                  onPressed: () {
                    //sign up with email
                    Authentication.register(context, _email, _password);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign up with email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
