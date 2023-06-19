import 'package:firebase_auth/firebase_auth.dart';

import 'login_platform.dart';

class AnonymousLogin {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInAnonymously(
      Function(LoginPlatform) updateLoginPlatform) async {
    try {
      final UserCredential userCredential = await _auth.signInAnonymously();
      final User? user = userCredential.user;

      if (user != null) {
        // Anonymous sign-in successful, update the login platform and handle further actions
        updateLoginPlatform(LoginPlatform.anonymous);
        // Perform any other necessary actions or navigate to the desired screen
      } else {
        // Sign-in failed
        print('Anonymous sign-in failed');
      }
    } catch (error) {
      print('Anonymous sign-in error: $error');
    }
  }

  Future<void> signOut(Function(LoginPlatform) updateLoginPlatform) async {
    try {
      await _auth.signOut();
      updateLoginPlatform(LoginPlatform.none);
      // Perform any other necessary actions or navigate to the desired screen
    } catch (error) {
      print('Sign out error: $error');
    }
  }
}
