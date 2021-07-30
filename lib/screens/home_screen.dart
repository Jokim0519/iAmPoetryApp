import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:i_am_poetry/constants.dart';
import 'package:i_am_poetry/screens/message_page.dart';
import 'package:i_am_poetry/screens/personal_account.dart';
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
  List<Post> postsList = [];

  void newPost(String text) {
    this.setState(() {
      postsList.add(new Post(text, widget.name));
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => PersonalAccount()));
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MessagePage()));
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
          Expanded(child: PostList(this.postsList)),
          TextInputWidget(
            username: '',
            callback: this.newPost,
          ),
        ],
      ),
    );
  }
}
