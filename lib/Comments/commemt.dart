import 'package:flutter/material.dart';
import 'package:flutter_main_app/Comments/CommentService.dart';

class Comment extends StatefulWidget {
  String postId;
  Comment({this.postId});

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  List comments;

  getSomecomments(String postId) async {
    var commentList = await new CommentService().getSomeComment(postId, '5');
    setState(() {
      comments = commentList;
    });
  }

  @override
  void initState() {
    super.initState();
    getSomecomments(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text(
                'Comments',
                style: TextStyle(fontSize: 20),
              ),
              comments == null
                  ? CircularProgressIndicator()
                  : Column(
                      children: comments
                          .map((e) => singleComment(context, e))
                          .toList(),
                    ),
              FlatButton.icon(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    print('more');
                  },
                  icon: Icon(Icons.more),
                  label: Text('more')),
            ],
          ),
        ),
      )),
    );
  }
}

Widget singleComment(context, commentData) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Card(
      child: ListTile(
          title: Text(
              '${commentData['userId']['name']} - ${commentData['userId']['description']}'),
          subtitle: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${commentData['comment']}'),
                Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      '${commentData['created']}',
                      style: TextStyle(fontSize: 10),
                    )),
              ],
            ),
          ),
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('images/3.jpeg'),
          ),
          trailing: IconButton(
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              onPressed: () {
                print('delete');
              })),
    ),
  );
}
