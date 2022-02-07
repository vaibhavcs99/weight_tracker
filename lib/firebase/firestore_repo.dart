import 'package:cloud_firestore/cloud_firestore.dart';

import '../instance/instances.dart';

class FirestoreRepo {
  static FirestoreRepo? _firestoreRepo;
  factory FirestoreRepo() {
    _firestoreRepo ??= FirestoreRepo._();
    return _firestoreRepo!;
  }
  FirestoreRepo._();

  CollectionReference<Map<String, dynamic>> weightData =
      AppFirestoreInstance.instance.collection('weightData');

  void addWeight({required String weight}) {
    weightData
        .add({
          'weight': weight,
          'timestamp': DateTime.now().millisecondsSinceEpoch
        })
        .then((value) => print("Weight Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getWeightCollectionStream() {
    Stream<QuerySnapshot<Map<String, dynamic>>> collectionStream =
        weightData.snapshots();
    return collectionStream;
  }
}
