import 'package:flutter/material.dart';
import 'package:flutter_main_app/Color/color.dart';
import 'package:flutter_main_app/Home/homeService.dart';
import 'package:flutter_main_app/addPost/add.dart';
import 'package:flutter_main_app/article/article.dart';
import 'package:flutter_main_app/author/author.dart';
import 'package:flutter_main_app/sharedWidget/category.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List articles = [];

  initData() async{
    var data = await new HomeService().getSomePost() ;
    setState(() {
      articles =  data;
    });
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                main_bar(context),
                articles == null
                    ? CircularProgressIndicator()
                    : Container(
                        child: Column(
                            children: articles.map((e) => article(context, e)).toList(),
                            ),
                      ),
                FlatButton(
                  minWidth: MediaQuery.of(context).size.width / 2,
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    print('more');
                  },
                  child: Text('More'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ////////////////////////////////////////////////////////////////

// ignore: non_constant_identifier_names
Widget main_bar(context) {
  return Container(
      color: new ShareColors().bluegrayColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Society problems",
                    style: TextStyle(
                        color: new ShareColors().blueColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  // FlatButton.icon(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.add),
                  //   label: Text("Add"),
                  //   color: new ShareColors().blueColor,
                  // )

                  Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.add),
                          iconSize: 30,
                          tooltip: 'Add new Experiment',
                          color: new ShareColors().blueColor,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => new Add()));
                          }),
                      IconButton(
                          icon: Icon(Icons.person_sharp),
                          iconSize: 30,
                          tooltip: 'Go to profile',
                          color: new ShareColors().blueColor,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => new Author(
                                      id: "fdkfjdkfjdkfjkdj",
                                    )));
                          })
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Container(
                height: 40,
                // sheard category
                child: new Category()
                // end
                ),
          ),
        ],
      ));
}

////////////////////// part two the artical ////////////////
// ignore: non_constant_identifier_names
Widget article(context, articelData) {
  Object _textAlign = Alignment.centerLeft;

  return Padding(
    padding: EdgeInsets.all(3),
    child: (Container(
      decoration: BoxDecoration(
        color: new ShareColors().bluegrayColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: _textAlign,
              child: Text(
                "${articelData['title']}",
                style: TextStyle(
                  color: new ShareColors().whiteColor,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Align(
              alignment: _textAlign,
              child: Text("${articelData['created']}",
                  style: TextStyle(
                    color: new ShareColors().grayColor,
                    fontSize: 10,
                  )),
            ),
            SizedBox(
              height: 7,
            ),
            Align(
              alignment: _textAlign,
              child: Text(
                "${articelData['description']}",
                style: TextStyle(
                  color: new ShareColors().whiteColor,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlatButton(
                  child: Text(_textAlign == Alignment.centerLeft
                      ? "Go to author"
                      : " الي صفحه الناشر"),
                  textColor: Colors.white,
                  color: new ShareColors().lightbluegrayColor,
                  onPressed: () {
                    print("go tot author " + articelData['userId']);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => new Author(
                              id: articelData['userId'],
                            )));
                  },
                ),
                FlatButton(
                  child: Text(_textAlign == Alignment.centerLeft
                      ? "Read More"
                      : "اقرا المقال"),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    print("read more " + articelData['_id']);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => new Article(id: articelData['_id'] ,)));
                  },
                )
              ],
            )
          ],
        ),
      ),
    )),
  );
}

// Padding(
//             padding: EdgeInsets.symmetric(horizontal: 5),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.black12,
//                 borderRadius: BorderRadius.circular(1),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(1),
//                 child: TextFormField(
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "  Search",
//                     border: InputBorder.none,
//                     prefixIcon: Icon(Icons.search),
//                   ),
//                   onSaved: (val) {
//                     _search = val;
//                   },
//                 ),
//               ),
//             ),
// ),
