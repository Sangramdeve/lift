import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lift/core/constants/api_urls.dart';
import 'package:lift/core/services/firebase_services.dart';

import '../../../core/services/api_services/api_services.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FireBaseServices fireBaseServices = FireBaseServices();
  final ApiServices apiServices =  ApiServices();

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      return null;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    storeCredential(userCredential.user);

    // Once signed in, return the UserCredential
    return userCredential.user;
  }

  Future<void> storeCredential(User? user) async {
    if (user != null) {
      Map<String, dynamic> userCreed = {
        'uid': user.uid,
        'image_url': user.photoURL ?? '',
        'fullName': user.displayName ?? '',
        "last_seen": FieldValue.serverTimestamp(),
      };
      await fireBaseServices.addDocument(
          collectionPath: 'User', document: user.uid, data: userCreed);
    }
  }

  Future<void> loginWithEmail(userCreed)async{
    final response = apiServices.postApi(ApiUrl.login, userCreed);
  }
}
