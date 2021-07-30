import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_am_poetry/constants.dart';
import 'package:i_am_poetry/services/database.dart';
import 'post.dart';

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;
  final String username;

  TextInputWidget({required this.callback, required this.username});

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    DataService(poem: widget.username).savePoem(controller.text);
    FocusScope.of(context).unfocus();
    controller.clear();
  }

  void getCurrentUser() {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(user.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      decoration: InputDecoration(
          fillColor: kMainColor,
          hoverColor: kMainColor,
          prefixIcon: Icon(Icons.message),
          labelText: "Type Your Poem",
          suffixIcon: IconButton(
            onPressed: this.click,
            icon: Icon(Icons.send),
            splashColor: Colors.blue,
            tooltip: "Post Message",
          )),
    );
  }
}
