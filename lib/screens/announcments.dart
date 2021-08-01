import 'package:flutter/material.dart';
import 'package:i_am_poetry/constants.dart';

class Announcments extends StatefulWidget {
  const Announcments({Key? key}) : super(key: key);

  @override
  _AnnouncmentsState createState() => _AnnouncmentsState();
}

class _AnnouncmentsState extends State<Announcments> {
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
          Card(),
          Card(),
          Card(),
          Card(),
          Card(),
        ]),
      ),
    );
  }
}
