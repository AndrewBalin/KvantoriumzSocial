import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kvantorium/styles.dart' as kv_style;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:kvantorium/Default/autorisationScreen.dart';
import 'dart:math' as math;

class Intro1 extends StatefulWidget {
  const Intro1({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Intro1> createState() => _Intro1();
}

class _Intro1 extends State<Intro1> {
  late PageController controller;
  int currentpage = 0;

  void initState() {
    super.initState();
    controller = PageController(
        initialPage: currentpage,
        keepPage: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Container(
                    //color: Colors.blue,
                    height: size.height - (size.height / 4) - 50,
                    width: size.width,
                    child: PageView(
                      controller: controller,
                      onPageChanged: (index) {
                        setState(() {
                          currentpage = index;
                        });
                        print(currentpage);
                      },
                      children: [
                        page1,
                        page2,
                        page3,
                        page4,
                        page5
                      ],
                    ),
                  ),
                ),
                SmoothPageIndicator(
                    controller: controller, // PageController
                    count: 5,
                    effect: const WormEffect(
                        dotColor: Color(0xffB8B8B8),
                        activeDotColor: Color.fromARGB(255, 2, 49, 161)
                    )
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  AutorisationScreen(log: false,)
                          )
                      );
                    },
                    child: Column(
                      children: [
                        const Text(
                          "Войти",
                          style: kv_style.blue_BankGothic_25,
                        ),
                        Image.asset("assets/Images/strip.jpg", scale: 1.5,)
                      ],
                    )
                )
              ]),


        )


    );
  }

  Column page1 = Column(
      verticalDirection: VerticalDirection.up,
      children: <Widget>[
        const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              'Узнайте самое важное и интересное о нашей оргнизации',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black),
                textAlign: TextAlign.center,
              ),
        ),
        const Text(
          'Об учрежднии',
          style: kv_style.black_BankGothic_30,
        ),
        Image.asset("assets/Images/Intro_page1.jpg", scale: 1.8,),
      ]);

  Column page2 = Column(
      verticalDirection: VerticalDirection.up,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Text(
            'Выбирайте какая область вам ближе и знакомьтесь с ней',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        const Text(
          'О направлениях',
          style: kv_style.black_BankGothic_30,
        ),
        Image.asset("assets/Images/Intro_page2.jpg", scale: 2,),
      ]);

  Column page3 = Column(
      verticalDirection: VerticalDirection.up,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Text(
            'Всегда будьте в курсе актуальных событий',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        const Text(
          'Новости',
          style: kv_style.black_BankGothic_30,
        ),
        Image.asset("assets/Images/Intro_page3.jpg", scale: 1.8,),
      ]);

  Column page4 = Column(
      verticalDirection: VerticalDirection.up,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Text(
            'Знайте в лицо тех, кто преподносит знания',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        const Text(
          'Наши педагоги',
          style: kv_style.black_BankGothic_30,
        ),
        Image.asset("assets/Images/Intro_page4.jpg", scale: 1.8,),
      ]);

  Column page5 = Column(
      verticalDirection: VerticalDirection.up,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Text(
            'Вдохновляйтесь успехами и проектами учеников',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        const Text(
          'Наши ученики',
          style: kv_style.black_BankGothic_30,
        ),
        Image.asset("assets/Images/Intro_page5.jpg", scale: 1.8,),
      ]);
}
