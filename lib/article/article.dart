import 'package:flutter/material.dart';
import 'package:flutter_main_app/Color/color.dart';

class Article extends StatefulWidget {
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [user(context), article(context)],
            ),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////
Widget user(context) {
  return Container(
    decoration: BoxDecoration(
      color: new ShareColors().bluegrayColor,
    ),
    child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            ListTile(
                title: Text("Mohamed Tamer"),
                subtitle: Text("2:30pm"),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/3.jpeg'),
                ),
                trailing: IconButton(
                    icon: Icon(Icons.save_alt),
                    onPressed: () {
                      print('saved');
                    })),
          ],
        )),
  );
}

/////////////////////////////////////////////////////////////////
Widget article(context) {
  return (Container(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 0),
        child: Image.asset('./images/2.jpeg'),
      ),

// add post category
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
            borderRadius: BorderRadius.circular(7),
          ),
          width: 70,
          height: 35,
          child: Center(
            child: Text(
              "#Work",
              style: TextStyle(
                color: new ShareColors().whiteColor,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
      // end post category

      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "this is my problem and i solve it like this",
          style: TextStyle(
              color: new ShareColors().whiteColor,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
            "Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. A paragraph is defined as “a group of sentences or a single sentence that forms a unit” (Lunsford and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long. Ultimately, a paragraph is a sentence or group of sentences that support one main idea. In this handout, we will refer to this as the “controlling idea,” because it controls what happens in the rest of the paragrap"),
      )
    ],
  )));
}
