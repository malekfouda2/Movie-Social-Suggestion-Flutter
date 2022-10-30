class dummyData {
  String email = "test@email.com";
  String password = "123";
  dummyData() {}
  bool compare(String email, String password) {
    if (email == this.email && password == this.password) {
      return true;
    } else {
      return false;
    }
  }
}
