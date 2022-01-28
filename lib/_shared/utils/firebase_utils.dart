import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future setupFirebase() async {
  await Firebase.initializeApp();
}

extension FirebaseDateUtils on DateTime {
  Timestamp get fbTimeStamp => Timestamp.fromDate(this);
}
