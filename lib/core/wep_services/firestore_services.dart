import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  final _fireStore = FirebaseFirestore.instance;

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _fireStore.doc(path);
    //debugPrint('Request Data : $data ');
    await reference.set(data);
  }

  Future<void> deleteData({required String path}) async {
    final reference = _fireStore.doc(path);
    //debugPrint('Request Data : $path ');
    reference.delete();
  }

  // Stream<T> documentsStream<T>({
  //   required String path,
  //   required T Function(Map<String, dynamic>? data, String documentId) builder,
  // }) {
  //   final reference = _fireStore.doc(path);
  //   final snapshots = reference.snapshots();
  //   return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  // }

  Stream<List<T>> collectionsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
  }) {
    Query query = _fireStore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map(
            (snapshot) => builder(
              snapshot.data() as Map<String, dynamic>,
              snapshot.id,
            ),
          )
          .where((value) => value != null)
          .toList();
      return result;
    });
  }

  Future<List<T>> getData<T>(
      {required String path,
      required T Function(Map<String, dynamic>? data, String documentId)
          builder}) async {
    CollectionReference collectionReference = _fireStore.collection(path);
    QuerySnapshot querySnapshot = await collectionReference.get();

    List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;

    return listDocs.map((e) {
      return builder(
        e.data() as Map<String, dynamic>,
        e.id,
      );
    }).toList();
  }
}
