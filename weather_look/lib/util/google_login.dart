import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:weather_look/util/login_platform.dart';

class GoogleLogin {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle(
      Function(LoginPlatform) updateLoginPlatform) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the sign-in process
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        // Sign-in successful, update the login platform and handle further actions
        updateLoginPlatform(LoginPlatform.google);
        // Perform any other necessary actions or navigate to the desired screen
      } else {
        // Sign-in failed
        print('Google sign-in failed');
      }
    } catch (error) {
      print('Google sign-in error: $error');
    }
  }
}
