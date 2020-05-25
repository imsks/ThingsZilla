import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  // Collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('components');

  // List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc){
  //     return Brew(
  //       // name: doc.data['name'] ?? '',
  //       // sugars: doc.data['sugars'] ?? '',
  //       // strength: doc.data['strength'] ?? ''
  //     );
  //   }).toList();
  // }

  // Future getComponentsData(QuerySnapshot snapshot) {
  //   return 
  // }
}