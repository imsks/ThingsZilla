import 'package:flutter/material.dart';
import 'package:thingszilla/constants.dart';
import 'package:thingszilla/styleGuide.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_switch/flutter_switch.dart';

class DevicesScreen extends StatefulWidget {
  static const String id = '/devices';

  @override
  _DevicesScreenState createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
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
    // return Container(
    //   child: componentList(),
    // );
    StreamBuilder builder =  StreamBuilder(
      stream: databaseReference.document('9W35o6x0uNBzLQ0411qB').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading");
        } else {
          return ListView.builder(
            itemCount: componentName.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              // component = componentName[index];
              // print(index);
              // print(componentName.length);
              print(componentName[index]);
              print(componentValue[index]);
              return _buildComponentCard(
                  componentName[index], componentValue[index]);
            },
          );
        }
        // var userDocument = snapshot.data;
      },
    );

    return builder;
  }

  // Widget build(BuildContext context) {
  //   String place = '';
  //   String component = '';
  //   bool isSwitchedOn = false;
  //   List list = ['Bulb1', 'Bulb2', 'Bulb3', 'Motor'];

  //   return Container(
  //     child: ListView.builder(
  //       itemCount: list.length,
  //       scrollDirection: Axis.vertical,
  //       itemBuilder: (BuildContext context, int index) {
  //         component = list[index];
  //         return _buildComponentCard(component, isSwitchedOn);
  //       },
  //     ),
  //   );
  // }

  // ListView componentList() {
  //   return ListView.builder(
  //     itemCount: componentName.length,
  //     scrollDirection: Axis.vertical,
  //     itemBuilder: (BuildContext context, int index) {
  //       // component = componentName[index];
  //       // print(index);
  //       // print(componentName.length);
  //       //   print(componentName);
  //       // print(componentValue);
  //       return _buildComponentCard(componentName[index], componentValue[index]);
  //     },
  //   );
  // }

  Widget _buildComponentCard(String component, bool status) {
    // var DBRef = FirebaseDatabase.instance.reference().child('Components');
    // void writeData(String component, bool status) {
    //   DBRef.update({
    //     component: status,
    //   });
    // }

    // print(component);
    // print(status);

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
            // child: Switch(
            //   value: status,
            //   onChanged: (value) {
            //     // print(value);
            //     setState(() {
            //       status = value;
            //       print(status);
            //     });
            //     // setData(component, value);
            //     if (value) {
            //       setData(component, true);
            //     } else {
            //       setData(component, false);
            //     }
            //   },
            // ),
            child: FlutterSwitch(
              width: 125.0,
              height: 45.0,
              valueFontSize: 25.0,
              toggleSize: 30.0,
              value: status,
              borderRadius: 30.0,
              padding: 8.0,
              // showOnOff: true,
              onToggle: (value) {
                setState(() {
                  status = value;
                  // print(status);
                  setData(component, status);
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
