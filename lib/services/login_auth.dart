import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



/// Need create global and final var for Firebase auth class and Google sign class


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

// background method for sign in
Future<String> signInWithGoogle() async {

  // final v

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  // Firabase User class in  this class Googe Sign in
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}
