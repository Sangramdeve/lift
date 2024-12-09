import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getDocument(
      {required String collectionPath, required String document}) async {
    try {
      DocumentSnapshot snapshot =
          await firestore.collection(collectionPath).doc(document).get();
      return snapshot;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addDocument(
      {required String collectionPath,
      required String document,
      required Map<String, dynamic> data}) async {
    try {
      await firestore.collection(collectionPath).doc(document).set(data);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateDocument(
      {required String collectionPath,
      required String document,
      required Map<String, dynamic> data}) async {
    try {
      await firestore.collection(collectionPath).doc(document).update(data);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> deleteDocument({
    required String collectionPath,
    required String document,
  }) async {
    try {
      await firestore.collection(collectionPath).doc(document).delete();
    } catch (error) {
      rethrow;
    }
  }

  Future<QuerySnapshot> queryDocument(
      {required String collectionPath,
      required String param,
      required String value}) async {
    try {
      QuerySnapshot snapshot = await firestore
          .collection(collectionPath)
          .where(param, isEqualTo: value)
          .get();
      return snapshot;
    } catch (error) {
      rethrow;
    }
  }
}
