import 'package:flutter/material.dart';
import'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Homepage extends StatefulWidget {
  @override
   _HomepageState createState() => _HomepageState();
}

String Username ='';
_nameRetriever() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

setState(){
 Username = prefs.getString('username') ?? '';
//  schoolText = prefs.getString('school') ?? '';
}
}




class _HomepageState extends State<Homepage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameRetriever();
    print(Username);
  }

   @override
   Widget build(BuildContext context) {
    return Scaffold(
    body: Row(
      children: [
        Container(
          child: Text(Username),
        )
      ],
    ),      
       
    );
  }
} 