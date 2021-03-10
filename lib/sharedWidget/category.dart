import 'package:flutter/material.dart';
import 'package:flutter_main_app/Color/color.dart';
import 'package:flutter_main_app/Home/HomePage.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  
  String _click = null;

  List<String> categories = [
    'money',
    'marr',
    'kid',
    'family',
    'work',
    'money1',
    'marr1',
    'kid1',
    'family1',
    'work1',
    'money2',
    'marr2',
    'kid2',
    'family2',
    'work2'
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color:  new ShareColors().bluegrayColor,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            categories.length,
            (index) => InkWell(
              onTap: () {
                setState(() {
                  _click = categories[index];
                });

                // new HomePage
                print(categories[index]);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: _click != categories[index]
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
    );
  }
}
