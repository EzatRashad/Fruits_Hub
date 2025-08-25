import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/services/firebase_services/database_service.dart';

class FirestoreService implements DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> addUserData(String path, Map<String, dynamic> data) async {
    await _firestore.collection(path).add(data);
  }
}
