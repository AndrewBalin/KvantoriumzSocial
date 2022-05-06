import 'package:flutter/material.dart';
import 'package:kvantorium/styles.dart' as kv_style;
import 'package:kvantorium/DataProfile.dart';
import 'dart:convert';

class DialogPreview extends StatelessWidget {
  DialogPreview({
    required this.login,
    required this.lastMessage,
    required this.size,
    required this.chat_id});

  final String login;
  final int chat_id;
  final lastMessage;
  final Size size;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("Container clicked");
        },
        child: Container(
          height: 90,
          width: size.width,
          child: Row(
              children: [
                const CircleAvatar(
                  radius: 35,

                  backgroundImage: NetworkImage(
                      'http://a0595760.xsph.ru/kvantorium/avatars/Teachers/2.jpg',
                      scale: 5,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      login,
                      style: kv_style.black_BankGothic_20,
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                    Row(
                      children: [
                        Text(
                            lastMessage
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(5, 0, 10, 0)),
                        const Text(
                            "18:54"
                        )
                      ],
                    )

                  ],
                ),

              ]

          ),
        )
    );
  }
}
