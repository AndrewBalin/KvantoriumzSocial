import 'package:flutter/material.dart';
import 'package:kvantorium/styles.dart' as kv_style;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  //color: Colors.blue,
                  height: size.height-(size.height/4),
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
                  controller: controller,  // PageController
                  count:  5,
                  effect: const WormEffect(
                    dotColor:  Color(0xffB8B8B8),
                    activeDotColor:  Color.fromARGB(255, 2, 49, 161)
                  )
              ),
              TextButton(
                  onPressed: () {

                 },
                  child: Column(
                    children: [
                      const Text(
                        "Войти",
                        style: kv_style.blue_BankGothic_25,
                      ),
                      Transform.rotate(
                        angle: 90 * math.pi / 180,
                        child: Icon(Icons.navigate_next, color: Color.fromARGB(255, 2, 49, 161), size: 80.0,)
                      )],
                  )
              )
            ]),





    );
  }

  Column page1 = Column(
      children: <Widget>[
        Image.asset("assets/Images/Intro_page1.jpg", scale: 0.7,),
        const Text(
          'Об учережднии',
          style: kv_style.black_BankGothic_30,
        ),
        const Text(
          'Узнайте самое важное и интересное о нашей оргнизации',
          style: TextStyle(fontSize: 20, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ]);

  Column page2 = Column(
      children: const <Widget>[
        Text(
          'О направлениях',
          style: kv_style.black_BankGothic_25,
        ),
        Text(
          'Узнайте самое важное и интересное о нашей оргнизации',
          style: TextStyle(fontSize: 20, color: Colors.black),
          textAlign: TextAlign.center,
        )]);

  Column page3 = Column(
      children: const <Widget>[
        Text(
          'Новости',
          style: kv_style.black_BankGothic_25,
        ),
        Text(
          'Узнайте самое важное и интересное о нашей оргнизации',
          style: TextStyle(fontSize: 20, color: Colors.black),
          textAlign: TextAlign.center,
        )]);

  Column page4 = Column(
      children: const <Widget>[
        Text(
          'Наши педагоги',
          style: kv_style.black_BankGothic_25,
        ),
        Text(
          'Узнайте самое важное и интересное о нашей оргнизации',
          style: TextStyle(fontSize: 20, color: Colors.black),
          textAlign: TextAlign.center,
        )]);

  Column page5 = Column(
      children: const <Widget>[
        Text(
          'Наши ученики',
          style: kv_style.black_BankGothic_25,
        ),
        Text(
          'Узнайте самое важное и интересное о нашей оргнизации',
          style: TextStyle(fontSize: 20, color: Colors.black),
          textAlign: TextAlign.center,
        )]);
}
