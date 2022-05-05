import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kvantorium/DataProfile.dart';
import 'package:kvantorium/Students/Home.dart';
import 'package:kvantorium/styles.dart' as kv_style;

class HomeStudent extends StatefulWidget {

  final Profile profile;

  HomeStudent({Key? key, required this.profile}) : super(key: key);

  @override
  _HomeStudentState createState() => _HomeStudentState(profile: profile);
}

class _HomeStudentState extends State<HomeStudent> {

  final Profile profile;
  _HomeStudentState({required this.profile});

  late int id;

  late var name = profile.name;
  late var surname = profile.surname;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Text(
            "$name\n$surname",
            style: kv_style.blue_BankGothic_25,
          ),
        ],

      ),
    );
  }
}