import 'package:flutter/material.dart';

import 'package:thingszilla/constants.dart';
import 'package:thingszilla/styleGuide.dart';
//import 'package:thingszilla/database/components toggle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Widget roundedContainer() {
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
                'aa',
                style: AppTheme.subHeading,
              ),
              Text(
                '4h',
                style: AppTheme.subHeading,
              ),
              Text(
                'aa',
                style: AppTheme.subHeading,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Switch(
            value: true,
            onChanged: (value) {
              value = !value;
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
