import 'package:index/data/dummydata.dart';

class LoginModel {
  dummyData d = new dummyData();
  String email = "";
  String password = "";
  LoginModel() {}
  bool compare(String email, String password) {
    if (email == this.email && password == this.password) {
      return true;
    } else {
      return false;
    }
  }
}
