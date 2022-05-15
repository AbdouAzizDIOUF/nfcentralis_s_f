import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:nfcentralis/models/user.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _userFromFirebaseUser(User? user) {
    return user == null ? null : AppUser(uid: user.uid);
  }


  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (exception) {
      if (kDebugMode) {
        print(exception.toString());
      }
      return null;
    }
  }

  Future registerWithEmailAndPassword(String name, String email, String password) async {
    try {
      UserCredential result =
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (exception) {
      if (kDebugMode) {
        print(exception.toString());
      }
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (exception) {
      if (kDebugMode) {
        print(exception.toString());
      }
      return null;
    }
  }
}