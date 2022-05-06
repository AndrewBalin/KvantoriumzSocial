import 'package:flutter/material.dart';
import 'package:kvantorium/styles.dart' as kv_style;
import 'package:kvantorium/DataProfile.dart';


class Calendar_student extends StatelessWidget {

  Calendar_student({required this.profile, required this.size});

  final Profile profile;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
          child: Column(
            children: [
              Text(
                "Мое\nрасписание",
                style: kv_style.black_BankGothic_30,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
              Container(
                  height: 500,
                  width: size.width - 60,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 2, 49, 161),
                      borderRadius: BorderRadius.circular(50)
                  )
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
              Container(
                  height: 500,
                  width: size.width - 60,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 2, 49, 161),
                      borderRadius: BorderRadius.circular(50)
                  )
              )
            ],
          )
      ),
    );
  }
}