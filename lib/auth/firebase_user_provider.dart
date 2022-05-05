import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SidemenuFirebaseUser {
  SidemenuFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

SidemenuFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SidemenuFirebaseUser> sidemenuFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SidemenuFirebaseUser>(
            (user) => currentUser = SidemenuFirebaseUser(user));
