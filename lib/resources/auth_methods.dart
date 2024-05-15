// ignore_for_file: non_constant_identifier_names, avoid_print, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> Signup(
      {required String email, required String password}) async {
    String res = "something error occured";
    print("signup method called");
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print("user id is ${cred.user!.uid}");
        await _firestore.collection('users').doc('${cred.user!.uid}').set({
          'email': email,
          'password': password,
          'uid': cred.user!.uid,
        });
        res = "success";

        return res;
      }
    } catch (e) {
      res = "failure";
      return res;
    }

    return res;
  }

  Future<String> login(
      {required String email, required String password}) async {
    String res = "something error occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
        return res;
      }
    } catch (err) {
      res = "failure";

      return res;
    }

    return res;
  }
}
