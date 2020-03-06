import 'package:flutter/material.dart';

import 'package:thingszilla/constants.dart';
import 'package:thingszilla/styleGuide.dart';
import 'package:thingszilla/screens/components/devices.dart';
import 'package:thingszilla/screens/components/reports.dart';
import 'package:thingszilla/screens/widgets/component card.dart';


class HomePage extends StatefulWidget {
  static const String id = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool isFirst = true;

  final tabs = [
    null,
    DevicesScreen(),
    ReportsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: AppBar(
            title: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'dashboard'.toUpperCase(),
                style: AppTheme.display1,
              ),
            ),
            elevation: 0,
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 15),
                height: 50,
                width: 50,
                decoration:
                    BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Name'),
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
            ),
            ListTile(
              title: Text(
                'Item 1',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: isFirst
          ? Container(
              child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    RoundedContainer(),
                    SizedBox(
                      height: 20,
                    ),
                    RoundedContainer(),
                  ],
                ),
              ),
            ))
          : tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.important_devices),
            title: new Text('Devices'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.graphic_eq), title: Text('Reports'))
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 1 || _currentIndex == 2) {
              isFirst = false;
            }
            if (_currentIndex == 0) {
              isFirst = true;
            }
          });
        },
      ),
    );
  }
}