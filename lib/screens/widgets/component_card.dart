// import 'package:flutter/material.dart';

// import 'package:thingszilla/constants.dart';
// import 'package:thingszilla/styleGuide.dart';
// //import 'package:thingszilla/database/components toggle.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ComponentCard extends StatefulWidget {
//   @override
//   _ComponentCardState createState() => _ComponentCardState();
// }

// class _ComponentCardState extends State<ComponentCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//       width: 320,
//       height: 120,
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             flex: 2,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Icon(
//                   Icons.lightbulb_outline,
//                   color: kSecondaryColor,
//                 ),
//                 Icon(
//                   Icons.timelapse,
//                   color: kSecondaryColor,
//                 ),
//                 Icon(
//                   Icons.room,
//                   color: kSecondaryColor,
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 6,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   component,
//                   style: AppTheme.subHeading,
//                 ),
//                 Text(
//                   '4h',
//                   style: AppTheme.subHeading,
//                 ),
//                 Text(
//                   'Room',
//                   style: AppTheme.subHeading,
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             // child: Switch(
//             //   value: status,
//             //   onChanged: (value) {
//             //     // print(value);
//             //     setState(() {
//             //       status = value;
//             //       print(status);
//             //     });
//             //     // setData(component, value);
//             //     if (value) {
//             //       setData(component, true);
//             //     } else {
//             //       setData(component, false);
//             //     }
//             //   },
//             // ),
//             child: FlutterSwitch(
//               width: 125.0,
//               height: 45.0,
//               valueFontSize: 25.0,
//               toggleSize: 30.0,
//               value: status,
//               borderRadius: 30.0,
//               padding: 8.0,
//               // showOnOff: true,
//               onToggle: (value) {
//                 print('1. Status is ${status} and Value is ${value}');
//                 setState(() {
//                   status = value;
//                   // print(status);
//                   setData(component, status);
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//       decoration: BoxDecoration(
//         color: kPrimaryColor,
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//       ),
//     );
//   };
//   }
// }