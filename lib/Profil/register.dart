import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rehberim/Profil/hata_exception.dart';
import 'package:flutter_rehberim/Profil/model/user.dart';
import 'package:flutter_rehberim/common_widget/platform_duyarli_alert_dialog.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rehberim/utils.dart';
import 'package:flutter_rehberim/utils/user_repository.dart';

enum FormType { Register, LogIn }

class MyRegisterPage extends StatefulWidget {
  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  var isActive = true;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _email;
  TextEditingController _sifre;
  String _butonText, _linkText;

  var _formType = FormType.LogIn;
  @override
  void initState() {
    super.initState();

    _email = TextEditingController(text: "");
    _sifre = TextEditingController(text: "");
  }

  void _degistir() {
    setState(() {
      _formType =
          _formType == FormType.LogIn ? FormType.Register : FormType.LogIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userRepo = Provider.of<UserRepository>(context);

    _butonText = _formType == FormType.LogIn ? "Giriş Yap " : "Kayıt Ol";
    _linkText = _formType == FormType.LogIn
        ? "Hesabınız Yok Mu? Kayıt Olun"
        : "Hesabınız Var Mı? Giriş Yapın";

  if (userRepo.durum == UserDurum.OturumAcik) {
      Future.delayed(Duration(milliseconds: 1), () {
        Navigator.of(context).popUntil(ModalRoute.withName("/"));
      });
    }



    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Giriş / Kayıt"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 88.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: kAppIcon,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              child: Form(
                                key: _formKey,
                                child: Center(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: _email,
                                          validator: (deger) {
                                            if (deger.length <= 0) {
                                              return "lütfen alanı doldurunuz";
                                            }
                                          },
                                          decoration: InputDecoration(
                                              labelText: "Email",
                                              border: OutlineInputBorder()),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: TextFormField(
                                          obscureText: isActive,
                                          controller: _sifre,
                                          validator: (deger) {
                                            if (deger.length <= 0) {
                                              return "lütfen alanı doldurunuz";
                                            }
                                          },
                                          decoration: InputDecoration(
                                              suffixIcon: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      isActive = !isActive;
                                                    });
                                                  },
                                                  child: Icon(Icons.lock)),
                                              labelText: "Şifre",
                                              border: OutlineInputBorder()),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(22.0),
                                        child: RaisedButton(
                                          onPressed: () async {
                                            if (_formType == FormType.LogIn) {
                                              try {
                                                User _girisYapanUser =
                                                    await userRepo
                                                        .signInWithEmailandPassword(
                                                            _email.text,
                                                            _sifre.text); 
                                              } on PlatformException catch (e) {
                                                PlatformDuyarliAlertDialog(
                                                  baslik: "Oturum Açma HATA",
                                                  icerik:
                                                      Hatalar.goster(e.code),
                                                  anaButonYazisi: 'Tamam',
                                                ).goster(context);
                                              }
                                            } else {
                                              try {
                                                User _olusturulanUser =
                                                    await userRepo
                                                        .createUserWithEmailAndPassword(
                                                            _email.text,
                                                            _sifre.text); 
                                              } on PlatformException catch (e) {
                                                PlatformDuyarliAlertDialog(
                                                  baslik:
                                                      "Kullanıcı Oluşturma HATA",
                                                  icerik:
                                                      Hatalar.goster(e.code),
                                                  anaButonYazisi: 'Tamam',
                                                ).goster(context);
                                              }
                                            }
                                          },
                                          child: Text(
                                            _butonText,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          color: Colors.green,
                                        ),
                                      ),
                                      Center(
                                        child: FlatButton(
                                          onPressed: () => _degistir(),
                                          child: Text(_linkText),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
