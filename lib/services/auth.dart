import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:i_am_poetry/model/myAppUser.dart';
import 'package:i_am_poetry/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyAppUser? _userFromFireBaseUser(User? user) {
    user != null ? MyAppUser(uid: user.uid, email: user.email) : null;
  }

  Future registerFirebaseUser(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      DataService(uid: user!.uid).saveUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future loginFirebaseUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOutFirebaseUser() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<MyAppUser?> get user =>
      _auth.authStateChanges().map(_userFromFireBaseUser);
}
