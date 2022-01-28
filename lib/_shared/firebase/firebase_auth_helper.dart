import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  static Future<UserCredential> signUpWithEmailAndPassword(
      {required FirebaseAuth auth,
      required String email,
      required String password}) async {
    return await auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<UserCredential> loginInWithEmailAndPassword(
      {required FirebaseAuth auth,
      required String email,
      required String password}) async {
    return await auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<UserCredential> loginWithEmailLink(
      {required FirebaseAuth auth,
      required String email,
      required String emailLink}) async {
    return await auth.signInWithEmailLink(email: email, emailLink: emailLink);
  }
}
