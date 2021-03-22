import 'package:flutter/material.dart';
import 'package:swasthyaloop/Screens/Welcome/welcome_screen.dart';
import 'package:swasthyaloop/constants.dart';
import 'Homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';


Widget defaultHome;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool isLogged = (pref.getBool('isLogged') ?? false) ;
  WidgetsFlutterBinding.ensureInitialized();
  // username = (pref.get('username') ?? '');
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
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: defaultHome,
      routes: <String, WidgetBuilder>{
        "/home" : (BuildContext context) => Homepage(),
        // "/b" : (BuildContext context) => Profile(),
        // "/c" : (BuildContext context) => Mascot()
      }
    );
  }
}
