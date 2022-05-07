import 'package:flutter/material.dart';
import 'package:kvantorium/styles.dart' as kv_style;
import 'package:kvantorium/DataProfile.dart';
import 'dart:convert';

class Message extends StatelessWidget {
  Message({
    required this.login,
    required this.size,
    required this.chat_id,
    required this.datatime,
    required this.text,
    required this.from_who,
    required this.from_id});

  final String login, datatime, text, from_who, from_id;
  final int chat_id;
  final Size size;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Container clicked");
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            color: Color.fromARGB(255, 196, 196, 196),
            constraints: BoxConstraints(
                minHeight: 50, minWidth: 150, maxWidth: 500),
            child: Text(
                text
            ),
          ),
          Text(datatime)
        ]
      )
    );
  }
}
