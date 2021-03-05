import 'package:flutter/material.dart';
import 'package:flutter_main_app/Color/color.dart';
import 'package:flutter_main_app/article/article.dart';

class Author extends StatefulWidget {

  String id ;
  Author({this.id});

  @override
  _AuthorState createState() => _AuthorState();
}

class _AuthorState extends State<Author> {
  List<Map<String, dynamic>> authorArticle = [
    {
      "name": 'management Money',
      "time": "2:30 pm",
      "snap": "this is taxk this is taxk this is taxk this is taxk",
      "id": "ojfkdjfkdj",
    },
    {
      "name": 'management Money',
      "time": "2:30 pm",
      "snap": "this is taxk this is taxk this is taxk this is taxk",
      "id": "ojfkdjfkdj",
    },
    {
      "name": 'management Money',
      "time": "2:30 pm",
      "snap": "this is taxk this is taxk this is taxk this is taxk",
      "id": "ojfkdjfkdj",
    },
    {
      "name": 'management Money',
      "time": "2:30 pm",
      "snap": "this is taxk this is taxk this is taxk this is taxk",
      "id": "ojfkdjfkdj",
    },
    {
      "name": 'management Money',
      "time": "2:30 pm",
      "snap": "this is taxk this is taxk this is taxk this is taxk",
      "id": "ojfkdjfkdj",
    },
    {
      "name": 'management Money',
      "time": "2:30 pm",
      "snap": "this is taxk this is taxk this is taxk this is taxk",
      "id": "ojfkdjfkdj",
    },
    {
      "name": 'management Money',
      "time": "2:30 pm",
      "snap": "this is taxk this is taxk this is taxk this is taxk",
      "id": "ojfkdjfkdj",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                user(context),
                Container(
                  child: Column(
                    children:
                        authorArticle.map((e) => article(context, e)).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget user(context) {
  return Container(
    decoration: BoxDecoration(
      color: new ShareColors().bluegrayColor,
    ),
    child: Padding(
        padding: EdgeInsets.all(1),
        child: Column(
          children: [
            ListTile(
              title: Text("Mohamed Tamer"),
              subtitle: Text("lifestyle coash"),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('images/3.jpeg'),
              ),
              trailing: FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.person_add),
                label: Text("Follow"),
                color: new ShareColors().blueColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "200",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text("Following",
                            style:
                                TextStyle(color: new ShareColors().grayColor))
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "2000",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text("Followers",
                            style:
                                TextStyle(color: new ShareColors().grayColor))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
  );
}

/////////////////////////////////////////////////////
///////////////////////// part two the artical ////////////////
// ignore: non_constant_identifier_names
Widget article(context, articelData) {
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
            Text(
              "${articelData['name']}",
              style: TextStyle(
                color: new ShareColors().whiteColor,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text("${articelData['time']}",
                style: TextStyle(
                  color: new ShareColors().grayColor,
                  fontSize: 10,
                )),
            SizedBox(
              height: 7,
            ),
            Text(
              "${articelData['snap']}",
              style: TextStyle(
                color: new ShareColors().whiteColor,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text("Read more"),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    print("read more " + articelData['id']);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => new Article()));
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
