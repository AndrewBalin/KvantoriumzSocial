import 'package:flutter/material.dart';
import 'package:kvantorium/styles.dart' as kv_style;
import 'package:kvantorium/DataProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kvantorium/Widgets/DialogPreview.dart';

class Messanger extends StatelessWidget {

  Messanger({required this.profile, required this.size});

  final Profile profile;
  final Size size;

  @override
  void initState() {
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
              //SingleChildScrollView(
               Column(
                  children: [
                    DialogPreview(login: "Павел ларионов", lastMessage: "Последнее сообщение", size: size, chat_id: 1,)
                  ],
                ),
            //  )

                ],))
        ]
    );
  }

}