import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kvantorium/DataProfile.dart';
import 'package:kvantorium/Students/Home.dart';
import 'package:kvantorium/styles.dart' as kv_style;

import 'package:kvantorium/Students/Profile.dart';
import 'package:kvantorium/Students/Calendar.dart';
import 'package:kvantorium/Students/Messender.dart';

class HomeStudent extends StatefulWidget {

  final Profile profile;

  HomeStudent({Key? key, required this.profile}) : super(key: key);

  @override
  _HomeStudentState createState() => _HomeStudentState(profile: profile);
}

class _HomeStudentState extends State<HomeStudent> {

  final Profile profile;

  _HomeStudentState({required this.profile});

  int currentIndex = 0;
  late PageController controller;

  late var name = profile.name;
  late var surname = profile.surname;
  late var id = profile.id;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
      if (index == 3) {
        return;
      }
      controller.jumpToPage(index);
    }
    );
  }

  void initState() {
    super.initState();
    controller = PageController(
      initialPage: currentIndex,
      keepPage: true,
    );
  }

  Future confirmDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Выход'),
          content: Text('Вы уверенны, что хотите выйти из приложения?'),
          actions: <Widget>[
            FlatButton(
              child: Text('НЕТ'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('ДА'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(

      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: onTabTapped,
        controller: controller,
        children: [
          Profile_student(profile: profile, size: size),
          Messanger(profile: profile, size: size),
          Calendar_student(profile: profile, size: size)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          onTabTapped(index);
          if (index == 3) {
            print("OK");
            confirmDialog(context);
          };
        },
        currentIndex: currentIndex,
        unselectedItemColor: Color(0xffB8B8B8),
        selectedFontSize: 20,
        selectedIconTheme: const IconThemeData(
            color: Color.fromARGB(255, 2, 49, 161), size: 40),
        selectedItemColor: const Color.fromARGB(255, 2, 49, 161),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Профиль"),
          BottomNavigationBarItem(
              icon: Icon(Icons.message), label: "Сообщения"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Расписание"),
          BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app), label: "Выход"),
        ],
      ),

    );
  }
}