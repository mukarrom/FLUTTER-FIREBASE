import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // firebase auth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  // google sign in
  Future<UserCredential> signInWithGoogle() async {
    // begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // get the auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // finally, let's sign in
    return await _firebaseAuth.signInWithCredential(credential);
  }

  // sign in with facebook
  Future<UserCredential> signInWithFacebook() async {
    // trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // once signed in, return the UserCredential
    return await _firebaseAuth.signInWithCredential(facebookAuthCredential);
  }

  Future<String> login(String email, String password) async {
    return 'token';
  }
}
