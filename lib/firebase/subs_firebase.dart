import 'package:cloud_firestore/cloud_firestore.dart';

class SubsFirebase {
  FirebaseFirestore _firebase = FirebaseFirestore.instance;
  CollectionReference? _subsCollection;

  SubsFirebase() {
    _subsCollection = _firebase.collection('subs');
  }

  Future<void> inssubs(Map<String, dynamic> map) async {
    return _subsCollection!.doc().set(map);
  }

  Future<void> updsubs(Map<String, dynamic> map, String id) async {
    return _subsCollection!.doc(id).update(map);
  }

  Future<void> delsubs(int id) async {
    return _subsCollection!.doc(id.toString()).delete();
  }

  Stream<QuerySnapshot> getAllsubs() {
    return _subsCollection!.snapshots();
  }


  Future<void> delFavorite(int id) async {
    try {
      await _firebase!.runTransaction((transaction) async {
        final querySnapshot =
            await _subsCollection!.where('id', isEqualTo: id).get();
        if (querySnapshot.docs.isNotEmpty) {
          final documentReference = querySnapshot.docs[0].reference;
          await transaction.delete(documentReference);
        }
      });
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

 Future<bool> searchPopular(int id) async{
   bool aux=false;
   try {
      await _firebase!.runTransaction((transaction) async {
        final querySnapshot =
            await _subsCollection!.where('id', isEqualTo: id).get();
        if (querySnapshot.docs.isNotEmpty) {
          aux=true;
        }else{
          aux=false;
        }
      });
    } catch (e) {
      aux=false;
    }
    return aux;
  }



  Future<void> getOnesubs (String id) async{
    var result= _subsCollection!.where('id', isEqualTo: id).snapshots();
    /*if(result != null)
    {
      return true;
    }
    return false;*/
    
  }

 
}