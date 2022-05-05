class Profile {

  final login;
  final ident;
  final rememb;

  Profile({this.ident, this.rememb, this.login});

  late String name;
  late String surname;
  late bool remember;
  late int id;

  void init() {
    name = login.split(' ')[0];
    surname = login.split(' ')[1];
    remember = rememb;
    id = ident;
  }


}