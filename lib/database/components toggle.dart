import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//
//import 'package:thingszilla/constants.dart';
//import 'package:thingszilla/styleGuide.dart';

class ComponentToggle extends StatelessWidget {
  String place;
  String component;
  bool isSwitchedOn;

  ComponentToggle({this.place, this.component, this.isSwitchedOn});

  @override
  Widget build(BuildContext context) {
    // TYPE 2 => GET VALUE
    final String _collection = '/test room';
    final Firestore _fireStore = Firestore.instance;

    getData() async {
      return await _fireStore.collection(_collection).getDocuments();
    }

    getData().then((val) {
//    if(val.documents.length > 0){
//      print(val.documents[0].data["bulb"]);
//    }
//    else{
//      print("Not Found");
//    }
      place = val.documents[0].data.toString();
      print(isSwitchedOn);
    });

    return Container(

    );
  }
}

//
//class ComponentToggle extends StatelessWidget {
//  String test = 'aa';
//
//  ComponentToggle(){
//    test = 'ss';
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
////    final databaseReference = Firestore.instance.collection("test room").document('main switch');
////    print(databaseReference);
//
//    return Container();
//  }
//}
//
//DocumentReference documentReference =
//Firestore.instance.collection("users").document("John");
//documentReference.get().then((datasnapshot) {
//if (datasnapshot.exists) {
//print(datasnapshot.data['email'].toString(););
////}

////TYPE 1 => SET VALUE
////  ComponentToggle componentToggle;
////  final databaseReference = Firestore.instance.collection("test room").document('main switch');
////  print(databaseReference.updateData({
////    'AC': false,
////  }));
//
//// TYPE 2 => GET VALUE
//final String _collection = '/House/Places/Rooms';
//final Firestore _fireStore = Firestore.instance;
//
//getData() async {
//  return await _fireStore.collection(_collection).getDocuments();
//}
//
//getData().then((val){
////    if(val.documents.length > 0){
////      print(val.documents[0].data["bulb"]);
////    }
////    else{
////      print("Not Found");
////    }
//print(val.documents[0].data);
//});
//
////  // TYPE 2 => REAL
////  final String _collection1 = '/House/Places/Rooms';
////  final Firestore _fireStore1 = Firestore.instance;
////
////  getData1() async {
////    return await _fireStore1.collection(_collection1).getDocuments();
////  }
////
////  getData1().then((val){
//////    if(val.documents.length > 0){
//////      print(val.documents[0].data["bulb"]);
//////    }
//////    else{
//////      print("Not Found");
//////    }
////    print(val.documents[0].data);
////  });
