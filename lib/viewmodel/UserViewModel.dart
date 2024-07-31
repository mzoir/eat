import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eat/model/user.dart';
import "package:eat/service/auth.dart";

class UserViewModel extends ChangeNotifier {

  static final User? _auth = FirebaseAuth.instance.currentUser;

  Usermodel? _user =  Usermodel(username: "", email:_auth!.email.toString() , uid: _auth!.uid.toString(), isVerify:_auth!.emailVerified);





}
