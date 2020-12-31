import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:dash_chat/dash_chat.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class Chat extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

String userName;
String uuid;

class _ChatScreenState extends State<Chat> {
  ChatUser user = ChatUser();
  TextEditingController nameController = new TextEditingController();
  SharedPreferences _prefs;

  @override
  void initState() {
    SharedPreferences.getInstance()
      ..then((prefs) {
        setState(() => this._prefs = prefs);
        getName();
        setChatName();
      });

    super.initState();
  }

  void onSend(ChatMessage message) async {
    if (userName == null || userName == "") {
      Alert(
          context: context,
          title: "GİRİŞ",
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(
              icon: Icon(Icons.account_circle),
              labelText: 'Nick Name',
            ),
          ),
          buttons: [
            DialogButton(
              onPressed: () {
                setName(nameController.text);
                Navigator.pop(context);
              },
              child: Text(
                "Kaydet",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ]).show();
      await FirebaseAuth.instance.signInAnonymously();
    }

    var documentReference = Firestore.instance
        .collection('messages')
        .document(DateTime.now().millisecondsSinceEpoch.toString());

    Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
        documentReference,
        message.toJson(),
      );
    });
  }

  void uploadFile() async {
    File result = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxHeight: 400,
      maxWidth: 400,
    );

    if (result != null) {
      String id = Uuid().v4().toString();

      final StorageReference storageRef =
          FirebaseStorage.instance.ref().child("chat_images/$id.jpg");

      StorageUploadTask uploadTask = storageRef.putFile(
        result,
        StorageMetadata(
          contentType: 'image/jpg',
        ),
      );
      StorageTaskSnapshot download = await uploadTask.onComplete;

      String url = await download.ref.getDownloadURL();

      ChatMessage message = ChatMessage(text: "", user: user, image: url);

      var documentReference = Firestore.instance
          .collection('messages')
          .document(DateTime.now().millisecondsSinceEpoch.toString());

      Firestore.instance.runTransaction((transaction) async {
        await transaction.set(
          documentReference,
          message.toJson(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new Visibility(
        visible: false,
        child: new FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('messages').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              ),
            );
          } else {
            List<DocumentSnapshot> items = snapshot.data.documents;
            var messages =
                items.map((i) => ChatMessage.fromJson(i.data)).toList();
            return DashChat(
              user: user,
              messages: messages,
              textInputAction: TextInputAction.send,
              sendOnEnter: true,
              inputDecoration: InputDecoration(hintText: "Question ?"),
              inputContainerStyle: BoxDecoration(
                border: Border.all(width: 0.0),
                color: Colors.white,
              ),
              onSend: onSend,
              showUserAvatar: true,
              avatarMaxSize: 50,
              messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
              dateFormat: DateFormat('yyyy-MMM-dd'),
              timeFormat: DateFormat('HH:mm'),
              inputTextStyle: TextStyle(fontSize: 16.0),
              trailing: <Widget>[
                IconButton(
                  icon: Icon(Icons.photo),
                  onPressed: uploadFile,
                )
              ],
            );
          }
        },
      ),
    );
  }

  Future<Null> setName(String val) async {
    await this._prefs.setString("name", val);
    await this._prefs.setString("uuid", Uuid().v4().toString());
    getName();
    setChatName();
  }

  void getName() {
    setState(() {
      userName = this._prefs.getString("name") ?? "";
      uuid = this._prefs.getString("uuid") ?? "";
    });
  }

  void setChatName() {
    user.name = this._prefs.getString("name") ?? "";
    user.uid = this._prefs.getString("uuid") ?? "";
  }
}
