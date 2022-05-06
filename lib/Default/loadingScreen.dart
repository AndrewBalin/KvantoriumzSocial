import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kvantorium/DataProfile.dart';
import 'package:kvantorium/Students/Home.dart';
import 'package:kvantorium/Default/autorisationScreen.dart';

class LoadingScreen extends StatefulWidget {

  final String login;
  final String who;
  final String password;
  final bool remember;

  LoadingScreen({Key? key, required this.login, required this.who, required this.password, required this.remember}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState(login: login, password: password, who: who, remember: remember);
}

class _LoadingScreenState extends State<LoadingScreen> {

  final String login;
  final String who;
  final String password;
  final bool remember;

  _LoadingScreenState(
      {required this.login, required this.who, required this.password, required this.remember});

  late int id;

  void loading() async {
    var response = await http.get(Uri.parse(
        "http://a0595760.xsph.ru/kvantorium/autorisation.php/?l='$login'&p='$password'&w='$who'"));
    print(response.body.toString());
    if (response.body.toString() != '') {
      id = int.parse(response.body.toString());
      Profile User = Profile(
        login: login,
        ident: id,
        rememb: remember,
        wh: who
      );
      User.init();
      if(who == 'Ученик') {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
              builder: (context) => HomeStudent(profile: User)
          ),
        );
      }
    }
    else {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
            builder: (context) => AutorisationScreen(log: true)
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    loading();

    return Scaffold(
      appBar: AppBar(
        title: Text("Загрузка"),
        backgroundColor: Color.fromARGB(255, 2, 49, 161),
      ),
      body: Center(
        child: Image.asset("assets/loading.gif"),

      ),
    );
  }
}