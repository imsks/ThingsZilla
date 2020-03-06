import 'package:flutter/material.dart';

import 'package:thingszilla/constants.dart';
import 'package:thingszilla/styleGuide.dart';
//import 'package:thingszilla/database/components toggle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoundedContainer extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<RoundedContainer> {
//  ComponentToggle componentToggle;

  String place = '';
  String component = '';
  bool isSwitchedOn = false;

  @override
  Widget build(BuildContext context) {
    final Firestore _fireStore = Firestore.instance;

    final String collectionTest= 'test room';
    final String dataForDoc = 'places-user';

    final String dataForPlaces = 'Places';
    final String dataForUser = 'User Data';

    final String dataForBedroom = 'Bedroom';
    final String dataForKitchen = 'Kitchen';

    _fireStore.collection(collectionTest).document(dataForDoc).get().then((doc) {
      // Bedroom Data
      Map<String, dynamic> bedroomData = doc.data[dataForPlaces][dataForBedroom];
      for(var book in bedroomData.entries) {
        place = dataForBedroom;
        component = book.key;
        isSwitchedOn = book.value;
      }
    });

    return Container(
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
                  place,
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
                setState(() {
                  isSwitchedOn = !isSwitchedOn;
                });
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


