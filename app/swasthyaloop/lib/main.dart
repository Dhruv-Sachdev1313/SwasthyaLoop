import 'package:flutter/material.dart';
import 'package:swasthyaloop/Screens/Welcome/welcome_screen.dart';
import 'package:swasthyaloop/constants.dart';
import 'Homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'search.dart';


Widget defaultHome;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences pref = await SharedPreferences.getInstance();
  bool isLogged = (pref.getBool('isLogged') ?? false) ;

  defaultHome = new WelcomeScreen();
  if (isLogged) {
    defaultHome = new Homepage();
  }
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swastyaloop',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: defaultHome,
      routes: <String, WidgetBuilder>{
        "/home" : (BuildContext context) => Homepage(),
        "/search" : (BuildContext context) => SearchPage(),
      }
    );
  }
}
