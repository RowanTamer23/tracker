import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupRepository {
  // final ApiConsumer Api;

  // SignupRepository();

  Future signUp(
    String name,
    String phone,
    String email,
    String password,
  ) async {
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'password must be at least 6 charachters ';
      } else if (e.code == 'email-already-in-use') {
        return 'this email is already in use';
      } else {
        return e.code.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future login(
    String email,
    String password,
  ) async {
    try {
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'wrong-password') {
        return 'wrong password';
      } else if (e.code == 'invalid-email') {
        return 'this email is already in use';
      }
    } catch (e) {
      return e.toString();
    }
  }
}
