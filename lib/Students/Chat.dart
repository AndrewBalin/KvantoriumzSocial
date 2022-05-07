import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kvantorium/styles.dart' as kv_style;
import 'package:kvantorium/DataProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kvantorium/Widgets/Messadge.dart';
import 'package:http/http.dart' as http;

class Chat extends StatefulWidget{

  Chat({required this.profile,required this.chat_id, required this.size, required this.name});

  final Profile profile;
  final int chat_id;
  final Size size;
  final String name;


  _Chat createState()=> _Chat(profile: profile, chat_id: chat_id, size: size, name: name);
}

class _Chat extends State<Chat> {


  _Chat(
      {required this.name, required this.size, required this.chat_id, required this.profile});

  TextEditingController _msg = TextEditingController();

  final Profile profile;
  final int chat_id;
  final Size size;
  final String name;

  var message;

  List<Message> Messages = [];

  void dialogs() async {
    var response = await http.get(Uri.parse(
        "http://a0595760.xsph.ru/kvantorium/get_chats.php?id=${profile.id}"));

    var dialog_list_json = response.body.split('//');

    for (int i = 0; i < dialog_list_json.length - 1; i++) {
      var dialog_list = jsonDecode(dialog_list_json[i]);
      print(dialog_list);
      Messages.add(Message(
        from_id: dialog_list['from_id'],
        chat_id: dialog_list['chat_id'],
        text: dialog_list['text'],
        from_who: dialog_list['from_who'],
        login: dialog_list['login'],
        datatime: dialog_list['datatime'],
        size: size,
      ));
      print(Messages);

      setState(() {});
    }
  }

  void sendMessage(msg) async {
    print(
        "http://a0595760.xsph.ru/kvantorium/send_message.php?text=$msg&from_who=${profile
            .who}&from_id=${profile.id}&chat_id=$chat_id");
    var response = await http.get(Uri.parse(
        "http://a0595760.xsph.ru/kvantorium/send_message.php?text=$msg&from_who=${profile
            .who}&from_id=${profile.id}&chat_id=$chat_id"));
  }

  @override
  void initState() {
    Messages.clear();
    dialogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
                  child: Column(
                      children: [
                        Text(
                          name,
                          style: kv_style.black_BankGothic_30,
                        ),

                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(

                                child: Expanded(
                                  child: ListView.builder(
                                      reverse: true,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 20
                                      ),
                                      itemCount: Messages.length,
                                      itemBuilder: (_,
                                          index) => Messages[index]),
                                ),),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .center,
                                  children: [
                                    Expanded(
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Container(
                                                width: size.width * 0.7,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .circular(50),
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 2, 49, 161),
                                                        // set border color
                                                        width: 5.0)),
                                                child: TextFormField(
                                                    controller: _msg,
                                                    validator: (String? value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        Fluttertoast
                                                            .showToast(
                                                            msg: "Проверьте правильность ввода данных",
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity: ToastGravity
                                                                .CENTER,
                                                            timeInSecForIosWeb: 1,
                                                            backgroundColor: Colors
                                                                .red,
                                                            textColor: Colors
                                                                .white,
                                                            fontSize: 16.0
                                                        );
                                                        return;
                                                      }
                                                      else {
                                                        message = value;

                                                        return;
                                                      }
                                                    },
                                                    decoration: InputDecoration(
                                                      labelStyle: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        color: Colors.black,
                                                      ),
                                                      prefixIcon: const Icon(
                                                        Icons.message,
                                                        color: Colors.black,),
                                                      border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 5.0,
                                                            color: Color
                                                                .fromARGB(
                                                                255, 2, 49,
                                                                161)),
                                                        borderRadius: BorderRadius
                                                            .circular(50),
                                                      ),
                                                      hintText: 'Введите сообщение',
                                                    )
                                                )),
                                            IconButton(
                                              onPressed: () {
                                                print(message);
                                                sendMessage(message);
                                                _msg.clear();
                                              },

                                              icon: Icon(Icons.navigate_next,
                                                  color: Color.fromARGB(
                                                      255, 2, 49, 161)),
                                              iconSize: 50,)
                                          ]),),

                                    /*Padding(
                                          padding: EdgeInsets.fromLTRB(30, 0,
                                              30, 0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(50),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 2, 49, 161),
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
                                                    Icons.message,
                                                    color: Colors.black,),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 5.0,
                                                        color: Color.fromARGB(
                                                            255, 2, 49, 161)),
                                                    borderRadius: BorderRadius
                                                        .circular(50),
                                                  ),
                                                  labelText: 'Введите сообщение',
                                                  floatingLabelBehavior: FloatingLabelBehavior
                                                      .never,
                                                ),
                                              )
                                          )
                                      ),*/
                                  ])

                            ]),
                      ]
                  )
              )
            ])
    );
  }
}


