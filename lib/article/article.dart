import 'package:flutter/material.dart';
import 'package:flutter_main_app/Color/color.dart';
import 'package:flutter_main_app/article/aticleService.dart';

class Article extends StatefulWidget {
  String id;
  Article({this.id});

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  Object articleData;

  initDate() async {
    var data = await new AricleService().getOneArticle(widget.id);
    setState(() {
      articleData = data;
    });

    print(data);
  }

  @override
  void initState() {
    super.initState();
    initDate();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: articleData == null ? Center(child: CircularProgressIndicator() ,):Column(
              children: [
                user(context, articleData),
                article(context, articleData),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////
Widget user(context, articleData) {
  return Container(
    decoration: BoxDecoration(
      color: new ShareColors().bluegrayColor,
    ),
    child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            ListTile(
                title: Text("${articleData['userId']['name']} - ${articleData['userId']['description']}"),
                subtitle: Text("${articleData['created']}"),
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
Widget article(context,articleData) {
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
              "#${articleData['category']}",
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
        padding: EdgeInsets.all(5),
        child: Text(
          "${articleData['description']}",
          style: TextStyle(
              color: new ShareColors().whiteColor,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
          padding: EdgeInsets.all(2),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    // border: Border.all(color: new ShareColors().whiteColor),
                    // borderRadius: BorderRadius.circular(7),
                    ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                      "${articleData['problem']}"),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                    // border: Border.all(color: new ShareColors().whiteColor),
                    // borderRadius: BorderRadius.circular(7),
                    ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                      "${articleData['solution']}"),
                ),
              ),
            ],
          ))
    ],
  )));
}
