import 'package:firebase_database/firebase_database.dart';

class DataService {
  final String? uid;
  final String? poem;
  DataService({this.uid, this.poem});
  final database = FirebaseDatabase.instance;

  Future? saveUser(user) {
    try {
      final userRef = database.reference().child('users').child(uid!);
      userRef.set({
        'uid': user.uid,
        'email': user.email,
        'password': user.password,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future? savePoem(user) {
    try {
      final userRef = database.reference().child('users').child(poem!);
      userRef.set({
        'user': user.uid,
        'email': user.email,
        'poem': user.poem,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
