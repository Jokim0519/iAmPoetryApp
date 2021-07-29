import 'package:flutter/material.dart';
import 'package:i_am_poetry/constants.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
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
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: kMainColor,
            size: 20.0,
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
              Navigator.pushNamed(context, '/fourth');
            },
            icon: Icon(
              Icons.account_circle_rounded,
              color: kMainColor,
              size: 50.0,
            ),
          ),
        ],
        elevation: 0,
      ),
    );
  }
}
