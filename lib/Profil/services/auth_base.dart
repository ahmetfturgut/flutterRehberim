 

import 'package:flutter_rehberim/Profil/model/user.dart';

abstract class AuthBase {
  Future<User> currentUser();
  Future<User> singInAnonymously();
  Future<bool> signOut();
  Future<User> signInWithGoogle();
}
