import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/material.dart';
import 'package:eat/home.dart';
import 'package:eat/view/log.dart';

class FireAuth with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth get auth => _auth;
  String _good = "";
  String? _uid;

  String? get uid => _uid;

  String get good => _good;

  Future<void> signUp(String email, String password) async {
    final UserCredential userCredential = await auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    _uid = userCredential.user!.uid;
    _good = '_succeed';

    notifyListeners();
  }

  Future<void> logIn(String email, String password) async {
    final UserCredential userCredential = await auth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    _uid = userCredential.user!.uid;
    _good = '_succeed';
    notifyListeners();
  }

  Future<void> logout() async {
    await _auth.signOut();
    notifyListeners();
  }
}
