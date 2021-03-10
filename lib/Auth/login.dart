import 'package:flutter/material.dart';
import 'package:flutter_main_app/Auth/signup.dart';
import 'package:flutter_main_app/Color/color.dart';
import 'package:flutter_main_app/Home/HomePage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Object _textAlign = TextAlign.left;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),

                  Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 35,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                    color:
                                        new ShareColors().lightbluegrayColor)),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: TextFormField(
                                textAlign: _textAlign,
                                decoration: InputDecoration(
                                  hintText: _textAlign == TextAlign.left
                                      ? "Email"
                                      : " البريد الالكتروني",
                                  border: InputBorder.none,
                                ),
                                onSaved: (val) {},
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                    color:
                                        new ShareColors().lightbluegrayColor)),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: TextFormField(
                                textAlign: _textAlign,
                                decoration: InputDecoration(
                                  hintText: _textAlign == TextAlign.left
                                      ? "Password"
                                      : " كلمه المرور",
                                  border: InputBorder.none,
                                ),
                                onSaved: (val) {},
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                            ),
                            minWidth: MediaQuery.of(context).size.width / 1.5,
                            height: 50,
                            textColor: Colors.white,
                            color: Colors.blue.shade700,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => new HomePage()));
                            },
                            child: Text("Login"),
                          ),
                          FlatButton(
                            // minWidth: MediaQuery.of(context).size.width / 1.5,
                            // height: 50,
                            textColor: Colors.black,
                            color: Colors.white,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => new SignUp()));
                            },
                            child: Text("SignUp"),
                          ),
                        ],
                      ),
                    ),
                  )
                  ///////////////// end form sign up////////////////////////////////////////////////////////////////
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
