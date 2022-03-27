import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CiteFinderFirebaseUser {
  CiteFinderFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

CiteFinderFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CiteFinderFirebaseUser> citeFinderFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CiteFinderFirebaseUser>(
            (user) => currentUser = CiteFinderFirebaseUser(user));
