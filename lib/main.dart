import 'package:flutter/material.dart';
import 'package:i_am_poetry/constants.dart';
import 'package:i_am_poetry/screens/welcome_page.dart';
import 'package:i_am_poetry/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(IAmPoetry());
}

class IAmPoetry extends StatefulWidget {
  @override
  _IAmPoetryState createState() => _IAmPoetryState();
}

class _IAmPoetryState extends State<IAmPoetry> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      print(e.toString());
      _error = true;
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Container(
        child: Text('Failed to connect'),
      );
    }
    if (!_initialized) {
      return Container(
        color: Colors.white,
        child:
            Center(child: Text('Connecting', textDirection: TextDirection.ltr)),
      );
    }
    return Streamer();
  }
}

class Streamer extends StatefulWidget {
  const Streamer({Key? key}) : super(key: key);

  @override
  _StreamerState createState() => _StreamerState();
}

class _StreamerState extends State<Streamer> {
  final _streamProvider = AuthService().user;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: _streamProvider,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return snapshot.connectionState == ConnectionState.waiting
                ? Container(child: Text('Still Waiting For Data'))
                : WelcomePage();
          } else {
            return Container(child: Text('Homepage'));
          }
        },
      ),
      theme: ThemeData.light().copyWith(
          primaryColor: kMainColor, scaffoldBackgroundColor: Colors.white),
      initialRoute: '/',
      // routes: {
      //   '/': (context) => WelcomePage(),
      //   '/first': (context) => LoginPage(),
      //   '/second': (context) => SignUp(),
      //   '/third': (context) => HomeScreen(''),
      //   '/fourth': (context) => PersonalAccount(),
      //   '/fifth': (context) => MessagePage(),
      // },
    );
  }
}
