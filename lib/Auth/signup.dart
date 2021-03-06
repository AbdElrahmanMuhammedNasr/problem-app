import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign up",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    )),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  minWidth: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  textColor: Colors.black,
                  color: Colors.white,
                  onPressed: () {},
                  child: Text('Continue with google'),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  minWidth: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {},
                  child: Text('Continue with Facebook'),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "or sign up with email ",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15, color: Colors.grey),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
