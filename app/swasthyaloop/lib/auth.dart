// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:swasthyaloop/Screens/Login/components/body.dart';
import 'main.dart' as main;

class AuthService {
  
  Future<bool> login(String username, String pass) async {
    CollectionReference patients =
        FirebaseFirestore.instance.collection('patients');
    QuerySnapshot docs = await patients
        .where('username', isEqualTo: username)
        .where('password', isEqualTo: password)
        .get();
    if (docs.docs.isEmpty) {
      print("Invalid Credentials");
      return false;
    } else {
      main.user = docs.docs[0].data();
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool("isLogged", true);
      pref.setString("username", main.user['username']);
      return true;
    }
  }

  // Logout
  Future<void> logout() async {
    // Simulate a future for response after 1 second.
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isLogged', false);
    pref.setString('username', '');
    return;
  }
}
