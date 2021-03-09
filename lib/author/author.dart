import 'package:flutter/material.dart';
import 'package:flutter_main_app/Color/color.dart';
import 'package:flutter_main_app/article/article.dart';
import 'package:flutter_main_app/author/AuthorService.dart';

class Author extends StatefulWidget {
  String id;
  Author({this.id});

  @override
  _AuthorState createState() => _AuthorState();
}

class _AuthorState extends State<Author> {
  Object userData;
  List userPosts;

  initUserData() async {
    var data = await new AutherService().getOneUser(widget.id);
    setState(() {
      userData = data;
    });
  }

  initUserPosts() async {
    var data = await new AutherService().getUserPosts(widget.id);
    setState(() {
      userPosts = data;
    });
  }

  @override
  void initState() {
    super.initState();
    initUserData();
    initUserPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Material(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
                          child: Container(
                child: Column(
                  children: [
                    userData == null
                        ? CircularProgressIndicator()
                        : user(context, userData),
                    // ///////////////////////////////////////////
                    userPosts == null
                        ? Text("")
                        : Column(
                            children: [
                              Text(
                                "${userPosts.length}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 23),
                              ),
                              Text("Posts",
                                  style:
                                      TextStyle(color: new ShareColors().grayColor))
                            ],
                          ),
                    // ///////////////////////////////////////////

                    userPosts == null
                        ? CircularProgressIndicator()
                        : Container(
                            child: Column(
                              children: userPosts
                                  .map((e) => article(context, e))
                                  .toList(),
                            ),
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: new ShareColors().blueColor,
        foregroundColor: new ShareColors().whiteColor,
        child: Icon(Icons.settings),
        onPressed: (){
          print("object");
        },
        ),
        bottomNavigationBar: BottomAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

Widget user(context, userData) {
  return Container(
    decoration: BoxDecoration(
      color: new ShareColors().bluegrayColor,
    ),
    child: Padding(
        padding: EdgeInsets.all(1),
        child: Column(
          children: [
            ListTile(
              title: Text("${userData['name']}"),
              subtitle: Text("${userData['description']}"),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('images/3.jpeg'),
              ),
              trailing: FlatButton.icon(
                onPressed: () {
                  print('follow');
                },
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
                          "${userData['following']}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text("Following",
                            style:
                                TextStyle(color: new ShareColors().grayColor))
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "${userData['followers']}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
              "${articelData['title']}",
              style: TextStyle(
                color: new ShareColors().whiteColor,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text("${articelData['created']}",
                style: TextStyle(
                  color: new ShareColors().grayColor,
                  fontSize: 10,
                )),
            SizedBox(
              height: 7,
            ),
            Text(
              "${articelData['description']}",
              style: TextStyle(
                color: new ShareColors().whiteColor,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text("Read more"),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => new Article(
                          id: articelData['_id'],
                        ),
                      ),
                    );
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
