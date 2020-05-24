import 'package:flutter/material.dart';
import 'package:thingszilla/constants.dart';
import 'package:thingszilla/styleGuide.dart';
import 'package:firebase_database/firebase_database.dart';

class DevicesScreen extends StatefulWidget {
  static const String id = '/devices';

  @override
  _DevicesScreenState createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  @override
  Widget build(BuildContext context) {
    String place = '';
    String component = '';
    bool isSwitchedOn = false;
    List list = ['Bulb1', 'Bulb2', 'Bulb3', 'Motor'];

    return Container(
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          component = list[index];
          return _buildComponentCard(component, isSwitchedOn);
        },
      ),
    );
  }

  Widget _buildComponentCard(String component, bool isSwitchedOn) {
    var DBRef = FirebaseDatabase.instance.reference().child('Components');
    void writeData(String component, bool status) {
      DBRef.update({
        component: status,
      });
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: 320,
      height: 120,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.lightbulb_outline,
                  color: kSecondaryColor,
                ),
                Icon(
                  Icons.timelapse,
                  color: kSecondaryColor,
                ),
                Icon(
                  Icons.room,
                  color: kSecondaryColor,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  component,
                  style: AppTheme.subHeading,
                ),
                Text(
                  '4h',
                  style: AppTheme.subHeading,
                ),
                Text(
                  'Room',
                  style: AppTheme.subHeading,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Switch(
              value: isSwitchedOn,
              onChanged: (value) {
                if(value) {
                  writeData(component, true);
                } else {
                  writeData(component, false);
                }
              },
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
