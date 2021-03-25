import 'package:flutter/material.dart';
import 'package:swasthyaloop/utils.dart';
import 'package:swasthyaloop/widgets/moods.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 0;
  AssetImage map = AssetImage("assets/map.jpg");

  void onTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
    if (_selectedIndex == 1) {
      Navigator.of(context).pushReplacementNamed('/search');
    } else if (_selectedIndex == 0) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      Navigator.of(context).pushReplacementNamed('/chat');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                _backBgCover(),
                _greetings(),
                // _moodsHolder(),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // _notificationCard(),
                    // _nextAppointmentText(),
                    // _appoinmentCard(),

                    _image(),
                    _areaSpecialistsText(),
                    _specialistsCardInfo(),
                    _specialistsCardInfo(),
                    _specialistsCardInfo(),

                    //_specialistsCardInfo(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.home,
                size: 30.0,
              ),
              title: Text('1')),
          BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.search,
                size: 30.0,
              ),
              title: Text('2')),
          BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.gratipay,
                size: 30.0,
              ),
              title: Text('3')),
        ],
        onTap: onTapped,
      ),
    );
  }

  Container _backBgCover() {
    return Container(
      height: 260.0,
      decoration: BoxDecoration(
        gradient: purpleGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }

  Widget _specialistsCardInfo() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1.0,
              blurRadius: 6.0,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color(0xFFD9D9D9),
                backgroundImage: NetworkImage(USER_IMAGE),
                radius: 36.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'Wellness\n',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Dr Ayor Kruger',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '\nPoplar Pharma Limited',
                          style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: '\nDermatologist \nSAn Franscisco CA | 5 min',
                          style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: purpleGradient,
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                            minWidth: 88.0,
                            minHeight: 36.0), // min sizes for Material buttons
                        alignment: Alignment.center,
                        child: const Text(
                          'Book Visit',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            LineAwesomeIcons.heart,
            color: lightColor,
            size: 36,
          ),
        ],
      ),
    );
  }

  Widget _areaSpecialistsText() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Hospitals In Your Area',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Text(
            'See All',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: midColor,
            ),
          ),
        ],
      ),
    );
  }

  Positioned _greetings() {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20.0)),
          SizedBox(height: 50.0),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(top: 30.0)),
              Text(
                'Search',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 150,
              ),
              IconButton(
                  icon: Icon(Icons.map), color: Colors.white, onPressed: () {}),
              IconButton(
                icon: Icon(Icons.sort),
                onPressed: () {},
                color: Colors.white,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 350.0,
            height: 60.0,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'Search'),
                ),
                // Padding(padding: EdgeInsets.only(bottom:10.0)),
                // TextField(
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: Colors.white,
                //     icon: Icon(Icons.location_on,color: Colors.white,),
                //     border: OutlineInputBorder(),
                //     hintText: 'Location'
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 350.0,
            height: 60.0,
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'Location'),
            ),
          )
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
        width: 600.0,
        child: Image(
          image: map,
          width: 550.0,
          height: 300.0,
        ));
  }
}
