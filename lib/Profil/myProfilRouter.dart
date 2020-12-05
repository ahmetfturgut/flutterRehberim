import 'package:flutter/material.dart';
import 'package:flutter_rehberim/Profil/login.dart';
import 'package:flutter_rehberim/Profil/myProfil.dart';
import 'package:flutter_rehberim/utils/user_repository.dart';

import 'package:provider/provider.dart';

class MyProfilRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UserRepository userRepo, child) {
        switch (userRepo.durum) {
          case UserDurum.Idle:
            return SplashEkrani();
          case UserDurum.OturumAciliyor:
          case UserDurum.OturumAcilmamis:
            return MyProfil();
          case UserDurum.OturumAcik:
            return MyProfil();
        }
      },
    );
  }
}

class SplashEkrani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Splash Ekranı"),
        ),
        body: Text("data"));
  }
}
