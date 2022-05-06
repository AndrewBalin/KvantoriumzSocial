import 'package:flutter/material.dart';
import 'package:kvantorium/styles.dart' as kv_style;
import 'package:kvantorium/DataProfile.dart';


class Profile_student extends StatelessWidget {

  Profile_student({required this.profile, required this.size});

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
                "${profile.name}\n${profile.surname}\n#${profile.id}",
                style: kv_style.black_BankGothic_30,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
              Row(
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(

                        value: 0.3,
                        semanticsLabel: 'Linear progress indicator',
                        strokeWidth: 15,
                        backgroundColor: Color(0xffB8B8B8),
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 2, 49, 161)),
                      )
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
                  Container(
                      width: size.width - 180,
                      height: 100,
                      child: const Text(
                        "Мой\nпрогресс\nобучения",
                        style: kv_style.black_BankGothic_25,
                      )
                  ),

                ],),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
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