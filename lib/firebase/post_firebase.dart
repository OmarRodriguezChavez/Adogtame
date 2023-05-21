import 'package:cloud_firestore/cloud_firestore.dart';

class PostFirebase {
  FirebaseFirestore _firebase = FirebaseFirestore.instance;
  CollectionReference? _postCollection;

  PostFirebase() {
    _postCollection = _firebase.collection('dogs');
  }

  Future<void> insPost(Map<String, dynamic> map) async {
    return _postCollection!.doc().set(map);
  }

  Future<void> updPost(Map<String, dynamic> map, String id) async {
    return _postCollection!.doc(id).update(map);
  }

  Future<void> delPost(String id) async {
    return _postCollection!.doc(id).delete();
  }

  Stream<QuerySnapshot> getAllPosts() {
    return _postCollection!.snapshots();
  }
}