import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studentapp/dailyquizbuttom/restapi.dart';

class MyDatabase {
  MyDatabase._();

  static final MyDatabase _instance = MyDatabase._();

  static MyDatabase get instance => _instance;

  CollectionReference<StudentApp> get reference => FirebaseFirestore.instance
      .collection('students')
      .withConverter<StudentApp>(
        fromFirestore: (json, options) => StudentApp.fromJson(json.data()!),
        toFirestore: (sApp, options) => sApp.toMap(),
      );

  Stream<QuerySnapshot<StudentApp>> get questionsStream =>
      reference.snapshots();
  Future<QuerySnapshot<StudentApp>> get questionsFuture =>
      reference.get();
}
