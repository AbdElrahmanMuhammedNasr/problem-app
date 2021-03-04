import 'package:flutter/material.dart';
import 'package:flutter_main_app/Color/color.dart';
import 'package:flutter_main_app/sharedWidget/category.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: new ShareColors().bluegrayColor,
            child: Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text("Choose post Category"),
                    ),
                    Container(
                        height: 50,
                        //  this is shared category
                        child: new Category()),
                    // end
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                              color: new ShareColors().lightbluegrayColor)),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "  Title",
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
                              color: new ShareColors().lightbluegrayColor)),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "  snapShot",
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
                              color: new ShareColors().lightbluegrayColor)),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: "  problem",
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
                              color: new ShareColors().lightbluegrayColor)),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: "  Solution",
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
                      child: FlatButton(
                          minWidth: MediaQuery.of(context).size.width,
                          // height: 200,
                          color: new ShareColors().blueColor,
                          onPressed: () {
                            print('add');
                          },
                          child: Text('Post')),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
