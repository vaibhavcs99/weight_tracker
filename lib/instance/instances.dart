import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppFirestoreInstance {
  static FirebaseFirestore? _firestoreInstance;

  static FirebaseFirestore get instance {
    _firestoreInstance ??= FirebaseFirestore.instance;
    return _firestoreInstance!;
  }
}
class AppAuthInstance {
  static FirebaseAuth? _firebaseAuth;

  static FirebaseAuth get instance {
    _firebaseAuth ??= FirebaseAuth.instance;
    return _firebaseAuth!;
  }
}
