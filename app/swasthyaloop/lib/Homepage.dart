import 'package:flutter/material.dart';
import'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Homepage extends StatefulWidget {
  @override
   _HomepageState createState() => _HomepageState();
}

String username ='';
class _HomepageState extends State<Homepage> {

  _nameRetriever() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username') ?? '';
    // print(username);
}

  @override
  void initState() {
    super.initState();
    _nameRetriever();

  }

   @override
   Widget build(BuildContext context) {
    return Scaffold(
    body: Row(
      children: [
        Container(
          child: Center(
            child: Text(username,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w800,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
} 