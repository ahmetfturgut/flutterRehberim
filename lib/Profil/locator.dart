 
import 'package:flutter_rehberim/Profil/repository/user_repository.dart'; 
import 'package:flutter_rehberim/Profil/services/fake_auth_service.dart';
import 'package:flutter_rehberim/Profil/services/firebase_auth_service.dart'; 
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FakeAuthenticationService()); 
  locator.registerLazySingleton(() => UserRepository()); 
}
