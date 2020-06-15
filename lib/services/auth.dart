import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Wrapper class for firebase Auth, makes use of the firebase_auth and google_sign_in packages
// Thanks to https://medium.com/flutter-community/flutter-implementing-google-sign-in-71888bca24ed for the awesome guide!
class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String> loginWithGoogle() async {
    final GoogleSignInAccount googleSignInAcc = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuth = await googleSignInAcc.authentication;

    final AuthCredential googleAuthCred = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuth.accessToken,
      idToken: googleSignInAuth.idToken,
    );

    final AuthResult authResult = await _firebaseAuth.signInWithCredential(googleAuthCred);
    final FirebaseUser user = authResult.user;

    // TODO: Are user and currentUser both necessary? for now assume yes
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _firebaseAuth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'Login with google succeeded: $user';
  }

  Future<String> logoutWithGoogle() async{
    await googleSignIn.signOut();

    return 'Logout with google succeeded';
  }
}