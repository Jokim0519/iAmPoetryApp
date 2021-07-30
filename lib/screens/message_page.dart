import 'package:flutter/material.dart';
import 'package:i_am_poetry/constants.dart';
import 'package:getwidget/getwidget.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  get image => null;

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
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(children: [
          Text(
            'Message Page Coming Soon',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 40.0,
              color: kMainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }
}
