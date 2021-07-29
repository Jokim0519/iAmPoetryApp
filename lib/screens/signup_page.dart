import 'package:flutter/material.dart';
import 'package:i_am_poetry/widgets/inputBox.dart';
import 'package:i_am_poetry/constants.dart';
import 'package:i_am_poetry/screens/home_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name = '';
  TextEditingController controller = new TextEditingController();

  void click() {
    this.name = controller.text;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomeScreen(this.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                inputFile(label: "Username"),
                inputFile(label: "Email"),
                inputFile(label: "Password", obscureText: true),
                inputFile(label: "Confirm Password ", obscureText: true),
                TextField(
                  controller: this.controller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_rounded),
                    labelText: "Type Your Name:",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 5,
                        color: Colors.black,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.done),
                      splashColor: kMainColor,
                      tooltip: "Submit",
                      onPressed: this.click,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 3, left: 3),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Navigator.pushNamed(context, '/third');
                },
                color: kMainColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account?"),
                Text(
                  " Login",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
