import 'package:flutter/material.dart';
import 'package:i_am_poetry/services/auth.dart';
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
  AuthService _auth = AuthService();

  void click() {
    this.name = controller.text;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomeScreen(this.name)));
  }

  @override
  Widget build(BuildContext context) {
    late String email;
    late String password;
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
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: mTextFieldDecoration.copyWith(
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: mTextFieldDecoration.copyWith(
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock)),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 3, left: 3),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              HomeScreen(email)));

                  var result =
                      await _auth.registerFirebaseUser(email, password);
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
