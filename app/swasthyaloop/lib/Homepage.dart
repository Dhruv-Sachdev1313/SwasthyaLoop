import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'main.dart' as main;
import 'Screens/Login/components/body.dart' as loginBody;


class Homepage extends StatefulWidget {
  @override
   _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Center(
            child: Text(
              loginBody.username,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                  fontFamily: 'Montserrat'
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Material(
          color: Colors.white30,
            child: GestureDetector(
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setBool('isLogged', false);
                pref.setString('username', '');
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    'Log out',
                    style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20.0,
                    fontFamily: 'Montserrat'
                  ),
                ),
              ),
            ),
          )
        ),

      ],
      ),
    );
  }
}