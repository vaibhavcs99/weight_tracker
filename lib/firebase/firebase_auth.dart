import 'package:firebase_auth/firebase_auth.dart';
import 'package:weight_tracker/instance/instances.dart';

class AppAuth {
  static AppAuth? _appAuth;
  factory AppAuth() {
    _appAuth ??= AppAuth._();
    return _appAuth!;
  }
  AppAuth._();

  Future<UserCredential> signInUser() async {
    UserCredential data = await AppAuthInstance.instance.signInAnonymously();
    return data;
  }

  void signOutUser() {
    AppAuthInstance.instance.signOut();
  }

  void listeners() {
    AppAuthInstance.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    //
    AppAuthInstance.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
}
