import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class EshopFirebaseUser {
  EshopFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

EshopFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<EshopFirebaseUser> eshopFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<EshopFirebaseUser>((user) => currentUser = EshopFirebaseUser(user));
