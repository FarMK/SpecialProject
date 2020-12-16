import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello/user.dart';

class AuthServices {
  FirebaseAuth _fauth = FirebaseAuth.instance;

  Future loginwithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _fauth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return MyUser.fromFirebase(user);
    } catch (ex) {
      return null;
    }
  }

  Future registerwithEmaolandPassword(String email, String password) async {
    try {
      UserCredential result = await _fauth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return MyUser.fromFirebase(user);
    } catch (ex) {
      return null;
    }
  }

  Future logOut() async {
    await _fauth.signOut();
  }

  Stream<MyUser> get currentUser {
    return _fauth
        .authStateChanges()
        .map((User user) => user != null ? MyUser.fromFirebase(user) : null);
  }
}
