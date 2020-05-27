import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum UserDurum { Idle, OturumAcilmamis, OturumAciliyor, OturumAcik }

class UserRepository with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  UserDurum _durum = UserDurum.Idle;

  UserRepository() {
    _auth = FirebaseAuth.instance;
    _auth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  FirebaseUser get user => _user;

  set user(FirebaseUser value) {
    _user = value;
  }

  UserDurum get durum => _durum;

  set durum(UserDurum value) {
    _durum = value;
  }

  Future<bool> signUp(String email, String sifre) async {
    try {
      _durum = UserDurum.OturumAciliyor;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email, password: sifre);
      return true;
    } catch (e) {
      _durum = UserDurum.OturumAcilmamis;
      notifyListeners();
      return false;
    }
  }


  Future<bool> signIn(String email, String sifre) async {
    try {
      _durum = UserDurum.OturumAciliyor;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: sifre);
      return true;
    } catch (e) {
      _durum = UserDurum.OturumAcilmamis;
      notifyListeners();
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _durum = UserDurum.OturumAcilmamis;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }



  Future<void> _onAuthStateChanged(FirebaseUser user) async {
    if (user == null) {
      _durum = UserDurum.OturumAcilmamis;
    } else {
      _user = user;
      _durum = UserDurum.OturumAcik;
    }
    notifyListeners();
  }
}