import 'package:firebase_auth/firebase_auth.dart';
import 'package:lisiko_creative/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //firebase user to custom user
  UserModel _userFromFirebase (User user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //user auth change stream
  Stream<UserModel> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential credential = await _auth.signInAnonymously();
      User user = credential.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //login with email and password
  Future login (String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = credential.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future register (String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = credential.user;
      return _userFromFirebase(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }

  //log out
  Future logOut () async {
    try {
      return _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}