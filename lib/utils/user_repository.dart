import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_rehberim/Profil/model/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum UserDurum { Idle, OturumAcilmamis, OturumAciliyor, OturumAcik }

class UserRepository with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;

  Firestore _firestore;
  UserDurum _durum = UserDurum.Idle;

  UserRepository() {
    _firestore = Firestore.instance;
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

  Future<bool> signUp(String name, String email, String sifre) async {
    try {
      _durum = UserDurum.OturumAciliyor;
      notifyListeners();
      var firebaseUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: sifre);
      _saveUserToFirebase(firebaseUser.user.uid, name, email);
      return true;
    } catch (e) {
      _durum = UserDurum.OturumAcilmamis;
      notifyListeners();
      return false;
    }
  }

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    } else {
      return User(userID: user.uid, email: user.email);
    }
  }

  Future<dynamic> getUser() async {
    try {
      _firestore.collection("users").getDocuments().then((val) {
        if (val.documents.length > 0) {
          return (val.documents[0].data["name"]);
        } else {
          print("Not Found");
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future<User> signInWithGoogle(String email, String sifre) async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount _googleUser = await _googleSignIn.signIn();

    if (_googleUser != null) {
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        AuthResult sonuc = await _auth.signInWithCredential(
            GoogleAuthProvider.getCredential(
                idToken: _googleAuth.idToken,
                accessToken: _googleAuth.accessToken));
        FirebaseUser _user = sonuc.user;
        return _userFromFirebase(_user);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<User> createUserWithEmailAndPassword(
      String email, String sifre) async {
    AuthResult sonuc = await _auth.createUserWithEmailAndPassword(
        email: email, password: sifre);
    return _userFromFirebase(sonuc.user);
  }

  Future<User> signInWithEmailandPassword(String email, String sifre) async {
    AuthResult sonuc =
        await _auth.signInWithEmailAndPassword(email: email, password: sifre);
    return _userFromFirebase(sonuc.user);
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
    final _googleSignIn = GoogleSignIn();
    await _googleSignIn.signOut();

    await _auth.signOut();
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

  void _saveUserToFirebase(String uid, String name, String email) {
    Map<String, dynamic> addUser = Map();
    addUser["uid"] = uid;
    addUser["name"] = name;
    addUser["email"] = email;
    _firestore
        .collection("users")
        .document(email)
        .setData(addUser)
        .then((v) => debugPrint("Kullanıcı başarıyla eklendi."))
        .catchError((error) => debugPrint("Kullanıcı eklenemedi. $error"));
  }
}
