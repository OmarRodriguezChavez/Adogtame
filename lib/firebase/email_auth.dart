import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class EmailAuth {

  final FirebaseAuth _auth= FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth facebookAuth = FacebookAuth.instance;

  Future<bool> registerWithEmailAndPassword({
    required  String email,
    required  String password,
    required String displayName
  }
  ) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user!.updateDisplayName(displayName);
      userCredential.user!.displayName!=displayName;
      userCredential.user!.reload();
      userCredential.user!.sendEmailVerification();
      print('User registered: ${userCredential.user}');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    }
  }

/*Future<void> sendEmailVerification() async {
    final FirebaseAuth user = await User.currentUser();
    user.
  }*/

Future<UserCredential> updateProfilePhoto({
    required UserCredential usuario,
    required String url,
    required String pass,
  }) async {
    try {
      print(pass.toString());
      await usuario.user!.updatePhotoURL(url);
      await usuario.user!.reload();
      UserCredential? userUpdated = await signInWithEmailAndPassword(
          email: usuario.user!.email.toString(), password: pass.toString());
      return userUpdated!;
      
    } catch (e) {
      print(e);
      return usuario;
    }
  }





  /*Future<bool> signInWithEmailAndPassword({
    required  String email,
    required  String password,
  }
  ) async {
    print(email);
    print(password);
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      print('User logged in: ${userCredential.user}');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    } 
  }*/


    Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      var cred =
          EmailAuthProvider.credentialWithLink(email: email, emailLink: email);
      print('User logged in: ${userCredential.user}');
      
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }


  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await facebookAuth.logOut();
      await _auth.signOut();
    } catch (e) {}
  }
}
