import 'package:flutter/material.dart';

import 'package:thingszilla/constants.dart';
import 'package:thingszilla/styleGuide.dart';
import 'package:thingszilla/screens/components/devices.dart';
import 'package:thingszilla/screens/components/reports.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thingszilla/screens/widgets/navbar_drawer.dart';

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

  final databaseReference = Firestore.instance.collection("components");
  List componentName = [];
  List componentValue = [];

  void setData(String component, bool status) async {
    await databaseReference.document("9W35o6x0uNBzLQ0411qB").updateData(({
          component: status,
        }));

    // DocumentReference ref = await databaseReference.add({
    //   'title': 'Flutter in Action',
    //   'description': 'Complete Programming Guide to learn Flutter'
    // });
    // print(ref.documentID);
  }

  void getData() async {
    // databaseReference.getDocuments().then((QuerySnapshot snapshot) {
    //   snapshot.documents.forEach((component) => {
    //     // print(component.data)
    //   });
    // });

    databaseReference.getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach(
        (item) => {
          // componentName = item.data.keys.toList(),
          // print(component),
          item.data.forEach(
            (key, value) {
              componentName.add(key);
              componentValue.add(value);
            },
          )
        },
      );
      // print(componentName);
      // print(componentValue);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

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
                'thingszilla'.toUpperCase(),
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
      drawer: NavigationDrawer(),
      body: isFirst
          ? DevicesScreen()
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
