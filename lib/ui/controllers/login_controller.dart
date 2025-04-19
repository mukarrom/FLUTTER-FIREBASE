import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  var email = "".obs;
  var password = "".obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  void login() {
    print("email: ${email.value}");
    print("password: ${password.value}");
  }

  void clear() {
    email.value = "";
    password.value = "";
  }

  // login with google
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
    return await auth.signInWithCredential(credential);
  }
}
