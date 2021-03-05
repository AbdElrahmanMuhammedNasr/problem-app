import 'package:flutter/material.dart';
import 'package:flutter_main_app/Color/color.dart';
import 'package:flutter_main_app/sharedWidget/category.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Object _textAlign = TextAlign.left;

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
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20, left: 5),
                        child: Text(
                          _textAlign == TextAlign.left
                              ? "Post Category"
                              : "تصنيف المشكله",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
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
                          textAlign: _textAlign,
                          decoration: InputDecoration(
                            hintText: _textAlign == TextAlign.left
                                ? "  Title"
                                : "عنوان",
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
                          textAlign: _textAlign,
                          decoration: InputDecoration(
                            hintText: _textAlign == TextAlign.left
                                ? "  snapshot"
                                : "وصف المشكله",
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
                          textAlign: _textAlign,
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: _textAlign == TextAlign.left
                                ? "  problem"
                                : "اكتب المشكله",
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
                          textAlign: _textAlign,
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: _textAlign == TextAlign.left
                                ? "  Solution"
                                : "الحل",
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
                          height: 60,
                          // height: 200,
                          color: new ShareColors().blueColor,
                          onPressed: () {
                            print('add');
                          },
                          child: Text(
                              _textAlign == TextAlign.left ? 'Post' : "نشر ")),
                    ),
                    SizedBox(
                      height: 25,
                    ),
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
