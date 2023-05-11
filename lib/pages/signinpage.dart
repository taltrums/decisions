import 'package:decisionsapp/pages/homepage.dart';
import 'package:decisionsapp/pages/registerpage.dart';
import 'package:decisionsapp/pages/resetpassword.dart';
import 'package:decisionsapp/utils/authentication.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _email, _password;

  @override
  void initState() {
    //ToDo: checkSignedIn
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueAccent[300],
          title: Text('Decisions App'),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 50),
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
                      Authentication.signinWithGoogle(context: context);
                      print('logged in with google');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign in with Google',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 20,
              ),
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
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ResetPassword()));
                },
                child: Text(
                  'forgot password?',
                  style: TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent[300]),
                    ),
                    onPressed: () {
                      Authentication.signin(context, _email, _password);
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Don\'t have an account?'),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text(
                  'Sign up Now',
                  style: TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}
