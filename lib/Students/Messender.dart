import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kvantorium/styles.dart' as kv_style;
import 'package:kvantorium/DataProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kvantorium/Widgets/DialogPreview.dart';
import 'package:http/http.dart' as http;

class Messanger extends StatefulWidget{

  Messanger({required this.profile, required this.size});

  final Profile profile;
  final Size size;

  _Messanger createState()=> _Messanger(size: size, profile: profile);
}

class _Messanger extends State<Messanger> {

  _Messanger({required this.profile, required this.size});

  final Profile profile;
  final Size size;

  List<DialogPreview> Dialog = [];

  void dialogs() async {
    var response = await http.get(Uri.parse(
        "http://a0595760.xsph.ru/kvantorium/get_chats.php?id=${profile.id}"));

    var dialog_list_json = response.body.split('//');

    for (int i = 0; i < dialog_list_json.length - 1; i++) {
      var dialog_list = jsonDecode(dialog_list_json[i]);
      print(dialog_list);
      Dialog.add(DialogPreview(login: dialog_list['name'],
          lastMessage: dialog_list['message'],
          size: size,
          chat_id: int.parse(dialog_list['id']), profile: profile,));
      print(Dialog);

    setState(() {});
    }
  }

  @override
  void initState() {
    Dialog.clear();
    dialogs();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
            child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Чаты",
                          style: kv_style.black_BankGothic_30,
                        ),
                        Icon(Icons.create)
                      ]),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 20)),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(255, 2, 49, 161),
                              // set border color
                              width: 5.0)),
                      child: TextFormField(
                        //key: _formKey,

                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          prefixIcon: const Icon(
                            Icons.search, color: Colors.black,),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 5.0,
                                color: Color.fromARGB(255, 2, 49, 161)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          labelText: 'Поиск',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      )
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 20)),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: Dialog.length,
                      itemBuilder: (_, index) => Dialog[index]),
                ])

            ,)
        ]
    );
  }
}

