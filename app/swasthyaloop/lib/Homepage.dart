import 'package:flutter/material.dart';
import'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Homepage extends StatefulWidget {
  @override
   _HomepageState createState() => _HomepageState();
}







class _HomepageState extends State<Homepage> {

  String Username ='';
  _nameRetriever() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

  
  this.Username = prefs.getString('username') ?? '';
  //  schoolText = prefs.getString('school') ?? '';
  
  print(Username);
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameRetriever();
    print(this.Username);
  }

   @override
   Widget build(BuildContext context) {
    return Scaffold(
    body: Row(
      children: [
        Container(
          child: Text(this.Username,
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
          ),
        )
      ],
    ),      
       
    );
  }
} 