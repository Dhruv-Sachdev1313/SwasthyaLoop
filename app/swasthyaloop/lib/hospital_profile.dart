import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
// import 'auth.dart';
import 'utils.dart';

class HospitalProfilePage extends StatefulWidget {
  @override
  _HospitalProfilePageState createState() => _HospitalProfilePageState();
}

class _HospitalProfilePageState extends State<HospitalProfilePage> {

  AssetImage map1 = AssetImage("assets/map.jpg");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          // leading: IconButton(
          //   icon: const Icon(Icons.edit, color: Colors.black54),
          //   onPressed: () {},
          // ),
          title: new Text(
            'Hospital Details',
            style: new TextStyle(
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: new Icon(
                Icons.close,
                color: Colors.black,
                size: 30,
              ),
              tooltip: 'close',
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/search');
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            ClipPath(
              child: Container(color: darkColor.withOpacity(0.8)),
              clipper: getClipper(),
            ),
            Positioned(
                width: MediaQuery.of(context).size.width,
                top: MediaQuery.of(context).size.height / 15,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                    child:Column(
                  children: <Widget>[
                    Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.pexels.com/photos/2108706/pexels-photo-2108706.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 7.0, color: lightColor)
                            ])),
                    SizedBox(height: 20.0),
                    Text(
                      "Hospital name",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 15.0),
                    Divider(color: Colors.black),
                    SizedBox(
                      height: 10.0
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: 100, height: 50),
                          child:
                            ElevatedButton(
                              onPressed:(){}, 
                              child: Text("Chat"),  
                              style: ElevatedButton.styleFrom(
                                      primary: Colors.purple,
                                    ),
                            ),
                        ),
                            ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: 100, height: 50),
                          child:
                            ElevatedButton(
                              onPressed:(){}, 
                              child: Text("Book Visit"),  
                              style: ElevatedButton.styleFrom(
                                      primary: Colors.purple,
                                    ),
                            ),
                        ),
                          ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.fromLTRB(20, 25, 0, 0),
                                child: Material(
                                  color: Colors.white30,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'TYPE:',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            ),
                                            
                                      ),
                                    ),
                                  ),
                                )
                                ),
                                Container(
                                padding: EdgeInsets.fromLTRB(20, 25, 0, 0),
                                child: Material(
                                  color: Colors.white30,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Private',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            fontFamily: 'Montserrat',
                                            ),
                                            
                                      ),
                                    ),
                                  ),
                                )
                                ),
                          ],
                        ),
                            Row(
                          children: [
                            Container(
                                padding: EdgeInsets.fromLTRB(20, 25, 0, 0),
                                child: Material(
                                  color: Colors.white30,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'CAPACITY:',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            ),
                                            
                                      ),
                                    ),
                                  ),
                                )
                                ),
                                Container(
                                padding: EdgeInsets.fromLTRB(20, 25, 0, 0),
                                child: Material(
                                  color: Colors.white30,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '90',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            fontFamily: 'Montserrat',
                                            ),
                                            
                                      ),
                                    ),
                                  ),
                                )
                                ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Divider(
                      color: Colors.black87,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Material(
                              color: Colors.white30,
                              child: GestureDetector(
                                onTap: () {},
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'CONTACT:',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            )
                            ),
                            Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Material(
                              color: Colors.white30,
                              child: GestureDetector(
                                onTap: () {},
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '2417-7600',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontFamily: 'Montserrat',
                                        
                                        ),
                                  ),
                                ),
                              ),
                            )
                            ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Material(
                              color: Colors.white30,
                              child: GestureDetector(
                                onTap: () {},
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'EMAIL:',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            )
                            ),
                            Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Material(
                              color: Colors.white30,
                              child: GestureDetector(
                                onTap: () {},
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'ajeh@vsnl.com',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontFamily: 'Montserrat',
                                        
                                        ),
                                  ),
                                ),
                              ),
                            )
                            ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Material(
                              color: Colors.white30,
                              child: GestureDetector(
                                onTap: () {},
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'WEBSITE:',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            )
                            ),
                            Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Material(
                              color: Colors.white30,
                              child: GestureDetector(
                                onTap: () {},
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'http://www.adityajyoteyehospital.org',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontFamily: 'Montserrat',
                                        
                                        ),
                                  ),
                                ),
                              ),
                            )
                            ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Material(
                              color: Colors.white30,
                              child: GestureDetector(
                                onTap: () {},
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'ADDRESS:',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            )
                            ),
                            Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Material(
                              color: Colors.white30,
                              child: GestureDetector(
                                onTap: () {},
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Valiji Ladha Road, Mulund(W)',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontFamily: 'Montserrat',
                                        
                                        ),
                                  ),
                                ),
                              ),
                            )
                            ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 600.0,
                      child: Image(
                        image: map1,
                        width: 550.0,
                        height: 300.0,
                      )),
                  ],
                )
                )
            )],
        
    )));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 3);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
