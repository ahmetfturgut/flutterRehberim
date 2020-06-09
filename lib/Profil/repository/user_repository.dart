 
import 'package:flutter_rehberim/Profil/locator.dart'; 
import 'package:flutter_rehberim/Profil/model/user.dart';
import 'package:flutter_rehberim/Profil/services/auth_base.dart'; 
import 'package:flutter_rehberim/Profil/services/fake_auth_service.dart';
import 'package:flutter_rehberim/Profil/services/firebase_auth_service.dart'; 
 

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthenticationService _fakeAuthenticationService =
      locator<FakeAuthenticationService>(); 
 

  AppMode appMode = AppMode.DEBUG;
  List<User> tumKullaniciListesi = [];
  Map<String, String> kullaniciToken = Map<String, String>();

  @override
  Future<User> currentUser() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.currentUser();
    } else {
      User _user = await _firebaseAuthService.currentUser();
       
        return _user;
    }
  }

  @override
  Future<bool> signOut() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signOut();
    } else {
      return await _firebaseAuthService.signOut();
    }
  }

  @override
  Future<User> singInAnonymously() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.singInAnonymously();
    } else {
      return await _firebaseAuthService.singInAnonymously();
    }
  } 
 

  User listedeUserBul(String userID) {
    for (int i = 0; i < tumKullaniciListesi.length; i++) {
      if (tumKullaniciListesi[i].userID == userID) {
        return tumKullaniciListesi[i];
      }
    }

    return null;
  }

  @override
  Future<User> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
 
 
 
}
