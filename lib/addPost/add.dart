import 'package:flutter/material.dart';
import 'package:flutter_main_app/Color/color.dart';

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
            child: Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DropdownButton<String>(
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                    SizedBox(
                      height: 50,
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
                      height: 50,
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
                      height: 50,
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
                      height: 50,
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
                      height: 50,
                    ),
                    Container(
                      child: FlatButton(
                          color: new ShareColors().blueColor,
                          onPressed: () {
                            print('add');
                          },
                          child: Text('Add')),
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
