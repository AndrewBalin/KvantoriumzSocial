class Profile {

  final wh;
  final login;
  final ident;
  final rememb;

  Profile({this.wh, this.ident, this.rememb, this.login});

  late String name;
  late String who;
  late String surname;
  late bool remember;
  late int id;

  void init() {
    name = login.split(' ')[0];
    surname = login.split(' ')[1];
    remember = rememb;
    id = ident;
    who = wh;
  }


}