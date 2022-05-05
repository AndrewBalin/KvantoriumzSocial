import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kvantorium/styles.dart' as kv_style;
import 'dart:math' as math;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:kvantorium/Default/loadingScreen.dart';

bool registr = false;
bool log = false;


class AutorisationScreen extends StatefulWidget {

  AutorisationScreen({Key? key}) : super(key: key);

  @override
  _AutorisationScreenState createState() => _AutorisationScreenState();

}

class _AutorisationScreenState extends State<AutorisationScreen> {

  final _formKey = GlobalKey<FormState>();
  var who, login, password;
  var remember = false;

  String? selectedValue;
  List<String> items = [
    'Ученик',
    'Родитель',
    'Наставник',
    'Администратор'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    var val;
    if(log == true) {
      Fluttertoast.showToast(
          msg: "Проверьте правильность ввода данных и подключение к сети!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0

      );
      log = false;
    }

    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 200, 40, 0),

        child: Form(
          key: _formKey,

            child: Column(
              children: [
                const Text(
                  "Авторизация",
                  style: kv_style.black_BankGothic_30,
                ),
                Container(
                    height: size.height-450,
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton2(

                        //key: _formKey,
                        isExpanded: true,
                        hint: Row(
                          children: const [
                            Icon(
                              Icons.business,
                              size: 16,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'Войти как',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: items.map((item) =>
                            DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                          });

                        },
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.grey,
                        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 5,
                            color: Color.fromARGB(255, 2, 49, 161),
                          ),
                          color: Colors.white,
                        ),
                        buttonHeight: 70,
                        buttonElevation: 4,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(255, 2, 49, 161),
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(100),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        //offset: const Offset(-20, 0),
                      ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            border: Border.all(
                                color: Color.fromARGB(255, 2, 49, 161),// set border color
                                width: 5.0)),
                            child: TextFormField(
                              //key: _formKey,

                                decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  prefixIcon: const Icon(Icons.person, color: Colors.black,),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5.0, color: Color.fromARGB(255, 2, 49, 161)),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                labelText: 'Логин',
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                            ),
                          validator: (var value) {
                            if (value == null || value.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Проверьте правильность ввода данных",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                              return;
                            }
                            else {
                              try {
                                value = value.toString().trim();
                                login = value;
                              } catch (e) {
                                Fluttertoast.showToast(
                                    msg: "Проверьте правильность ввода данных",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                                return;
                              }
                            }
                          },
                          )
                        ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            border: Border.all(
                                color: Color.fromARGB(255, 2, 49, 161),// set border color
                                width: 5.0)),
                        child: TextFormField(
                          //key: _formKey,
                          obscureText: true,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Проверьте правильность ввода данных",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                                return '';
                              }
                              else {
                                password = value;
                                print(password);
                              }

                            },
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            prefixIcon: const Icon(Icons.key, color: Colors.black,),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 5.0, color: Color.fromARGB(255, 2, 49, 161)),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            labelText: 'Пароль',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          )),
                      ),
                        CheckboxListTile(
                          title: Text("Запомнить меня"),
                          value: remember,
                          onChanged: (newValue) {
                            setState(() {
                               remember = newValue!;
                            });
                          },
                        ),
                        RaisedButton(
                          color: Color.fromARGB(255, 2, 49, 161),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoadingScreen()));
                            }
                          },
                          child: const Text('Вход', style: TextStyle(color: Colors.white, fontSize: 25),),
                        ),
                      ],
                    )
                )

              ],
            )
          ),
        ),
      ),
    );
  }
}