import 'package:flutter/material.dart';
import 'package:flutter_main_app/Color/color.dart';
import 'package:flutter_main_app/addPost/addService.dart';


class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  List<String> categories = [
    'money',
    'work',
    'marraid',
    'home',
    'study',
   
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool addSuccess = false;

  Object _textAlign = TextAlign.left;

  String _category = null;
  String _title = null;
  String _description = null;
  String _problem = null;
  String _solution = null;

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
                      height: 5,
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
                      height: 45,
                      //  this is  category
                      child: Container(
                        color: new ShareColors().bluegrayColor,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            categories.length,
                            (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  _category = categories[index];
                                });
                                print(categories[index]);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: _category != categories[index]
                                        ? Colors.black12
                                        : Colors.blue.shade700,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: 70,
                                  child: Center(
                                    child: Text(
                                      "#${categories[index]}",
                                      style: TextStyle(
                                        color: new ShareColors().whiteColor,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // end
                    // if post add succcess
                    addSuccess
                        ? Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Text('Add new Post success'),
                                )
                              ],
                            ),
                          )
                        : Text(''),

                    // if post add succcess

                    SizedBox(
                      height: 20,
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
                          onSaved: (val) {
                            _title = val;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                          onSaved: (val) {
                            _description = val;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                          onSaved: (val) {
                            _problem = val;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                          onSaved: (val) {
                            _solution = val;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: FlatButton(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 60,
                          // height: 200,
                          color: new ShareColors().blueColor,
                          onPressed: () {
                            _formKey.currentState.save();

                            final article = {
                              "userId": '6047c690d64ec21f34bdf922',
                              "category": _category,
                              "title": _title,
                              "description": _description,
                              "problem": _problem,
                              "solution": _solution,
                            };
                            Future<bool> response =
                                new AddService().addNewpost(article);

                            response.then((value) => setState(() {
                                  addSuccess = value;
                                }));
                            // print(response);
                          },
                          child: Text(
                              _textAlign == TextAlign.left ? 'Post' : "نشر ")),
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
