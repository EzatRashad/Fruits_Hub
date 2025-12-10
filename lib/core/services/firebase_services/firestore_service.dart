import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/services/firebase_services/database_service.dart';

class FirestoreService implements DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId,
      }) async {
    try {
      if (docId != null) {
        await _firestore.collection(path).doc(docId).set(data);
      } else {
        await _firestore.collection(path).add(data);
      }
    } catch (e) {
      log('Error adding user data: ${e.toString()}');
      throw Exception('Error adding user data: ${e.toString()}');
    }
  }

  @override
  Future<dynamic> getData({String? docId, required String path, Map<String, dynamic>? query}) async {
    try {
      log("Fetching data from path: $path with docId: $docId and query: $query");
      if (docId != null) {
        log("Fetching document with docId: $docId from path: $path");
        var data = await _firestore.collection(path).doc(docId).get();
        return data.data();
      } else {
        log("Fetching collection from path: $path with query: $query");
        Query<Map<String, dynamic>> data = await _firestore.collection(path);
        if (query != null) {
          if (query.containsKey('orderBy')) {
            data = data.orderBy(query['orderBy'], descending: query['descending'] ?? false);
            log("Ordering collection by ${query['orderBy']} descending: ${query['descending'] ?? false}");
          }
          if (query.containsKey('limit')) {
            data = data.limit(query['limit']);
            log("Limiting collection to ${query['limit']} documents");
          }
        }
        var result = await data.get();
        log("Fetched ${result.docs.length} documents from collection at path: $path");

        if (result.docs.isNotEmpty) {
          return result.docs.map((e) => e.data()).toList();
        } else {
          log('No documents found in the collection at path: $path');
          throw Exception(
              'No documents found in the collection at path: $path');
        }
      }
    } catch (e) {
      throw Exception('Error fetching user data: ${e.toString()}');
    }
  }

  @override
  Future<bool> checkDataExists(
      {required String docId, required String path}) async {
    try {
      var doc = await _firestore.collection(path).doc(docId).get();
      return doc.exists;
    } catch (e) {
      log('Error checking if user data exists: ${e.toString()}');
      throw Exception('Error checking if user data exists: ${e.toString()}');
    }
  }
}
