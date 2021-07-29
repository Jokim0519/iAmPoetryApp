import 'package:flutter/material.dart';
import 'package:i_am_poetry/constants.dart';
import 'package:i_am_poetry/widgets/post.dart';
import 'package:i_am_poetry/widgets/postList.dart';
import 'package:i_am_poetry/widgets/textinputWidget.dart';

class HomeScreen extends StatefulWidget {
  final String name;

  HomeScreen(this.name);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts = [];

  void newPost(String text) {
    this.setState(() {
      posts.add(new Post(text, widget.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          padding: EdgeInsets.only(
            left: 5,
            bottom: 5,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/fourth');
          },
          icon: Icon(
            Icons.account_circle_outlined,
            color: kMainColor,
            size: 50.0,
          ),
        ),
        title: Text(
          'iAmPoetry',
          style: TextStyle(color: kMainColor),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(
              right: 5,
              bottom: 5,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/fifth');
            },
            icon: Icon(
              Icons.add_circle_outline_outlined,
              color: kMainColor,
              size: 50.0,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: PostList(this.posts)),
          TextInputWidget(this.newPost),
        ],
      ),
    );
  }
}
