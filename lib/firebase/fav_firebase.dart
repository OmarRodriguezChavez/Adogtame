import 'package:cloud_firestore/cloud_firestore.dart';

class FavFirebase {
  FirebaseFirestore _firebase = FirebaseFirestore.instance;
  CollectionReference? _postCollection;

  FavFirebase() {
    _postCollection = _firebase.collection('favs');
  }

  Future<void> insPost(Map<String, dynamic> map) async {
    return _postCollection!.doc().set(map);
  }

  Future<void> updPost(Map<String, dynamic> map, String id) async {
    return _postCollection!.doc(id).update(map);
  }

  Future<void> delPost(String id) async {
    try {
      await _firebase!.runTransaction((transaction) async {
        final querySnapshot =
            await _postCollection!.where('id', isEqualTo: id).get();
        if (querySnapshot.docs.isNotEmpty) {
          final documentReference = querySnapshot.docs[0].reference;
          await transaction.delete(documentReference);
        }
      });
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  Stream<QuerySnapshot> getAllPosts() {
    return _postCollection!.snapshots();
  }
}