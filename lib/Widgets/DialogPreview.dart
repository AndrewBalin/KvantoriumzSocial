import 'package:flutter/material.dart';
import 'package:kvantorium/styles.dart' as kv_style;
import 'package:kvantorium/DataProfile.dart';
import 'package:kvantorium/Students/Chat.dart';
import 'dart:convert';

class DialogPreview extends StatelessWidget {
  DialogPreview({
    required this.login,
    required this.lastMessage,
    required this.size,
    required this.chat_id,
    required this.profile});

  final Profile profile;
  String login;
  final int chat_id;
  String lastMessage;
  final Size size;


  @override
  Widget build(BuildContext context) {
    if(lastMessage == 'null') {
      lastMessage = "Диалог ещё не начат";
    }
    if(login.length > 12) {
      login = "${login[0]}${login[1]}${login[2]}${login[3]}${login[4]}${login[5]}${login[6]}${login[7]}${login[8]}${login[9]}${login[10]}${login[11]}${login[12]}...";
    }
    return GestureDetector(
        onTap: () {
          print("Container clicked");
          Navigator.push(context, MaterialPageRoute(builder: (context) => Chat(chat_id: chat_id, profile: profile, size: size, name: login,)));
        },
        child: Container(
          height: 100,
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
