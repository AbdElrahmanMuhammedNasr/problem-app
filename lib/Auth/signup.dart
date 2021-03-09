import 'package:flutter/material.dart';
import 'package:flutter_main_app/Color/color.dart';
import 'package:flutter_main_app/Home/HomePage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton.icon(
                    minWidth: MediaQuery.of(context).size.width,
                    height: 50,
                    textColor: Colors.black,
                    color: Colors.white,
                    onPressed: () {
                      print('google');
                    },
                    icon: Image.asset(
                      'images/google.png',
                      scale: 2,
                    ),
                    label: Text('Continue with google'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton.icon(
                    minWidth: MediaQuery.of(context).size.width,
                    height: 50,
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () {
                      print('facebook');
                    },
                    icon: Image.asset(
                      'images/facebook.png',
                      scale: 1.6,
                    ),
                    label: Text('Continue with facebook'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "or sign up with email ",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.grey),
                      )),
                  ///////////////// form sign up////////////////////////////////////////////////////////////////
                  SizedBox(
                    height: 35,
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: new ShareColors().lightbluegrayColor),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: TextFormField(
                                textAlign: _textAlign,
                                decoration: InputDecoration(
                                  hintText: _textAlign == TextAlign.left
                                      ? "Name"
                                      : "اسم المستخدم",
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
                            minWidth: MediaQuery.of(context).size.width / 1.5,
                            height: 50,
                            textColor: Colors.black,
                            color: Colors.white,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => new HomePage()));
                              print('signUp');
                            },
                            child: Text("Sign up"),
                          )
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
