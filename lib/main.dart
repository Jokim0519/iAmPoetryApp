import 'package:flutter/material.dart';
import 'package:i_am_poetry/screens/message_page.dart';
import 'package:i_am_poetry/screens/personal_account.dart';
import 'constants.dart';
import 'screens/home_screen.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';
import 'screens/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(IAmPoetry());
}

class IAmPoetry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          primaryColor: kMainColor, scaffoldBackgroundColor: Colors.white),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/first': (context) => LoginPage(),
        '/second': (context) => SignUp(),
        '/third': (context) => HomeScreen(''),
        '/fourth': (context) => PersonalAccount(),
        '/fifth': (context) => MessagePage(),
      },
    );
  }
}
