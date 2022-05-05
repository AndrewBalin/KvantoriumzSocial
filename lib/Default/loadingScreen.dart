import 'dart:async';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {

  LoadingScreen({Key? key}) : super(key: key);


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    /*var temp = reg(name, surname, patronymic, school, password);

    Future.delayed(Duration(seconds: 3), () async {
      if(!teacher) {
        if (registr) {
          log = false;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => WorksPage(title: "")));
        } else {
          log = true;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LogIn(title: '',)));
        }
      }
      else {
        if (registr) {
          log = false;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => TeacherPage(title: '',)));
        } else {
          log = true;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LogIn(title: '',)));
        }
      }
    });*/


    return Scaffold(
        appBar: AppBar(
          title: Text("Загрузка"),
          backgroundColor: Color.fromARGB(255, 2, 49, 161),
        ),
        body: Center(
          child: Image.asset("assets/loading.gif"),

        )
    );
  }
}