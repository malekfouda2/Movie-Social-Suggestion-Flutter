class User{
  final String email;
  final String password;
  final String name;
  final String gender;
  final String age;
  final String country;
  
  const User({
    this.email='',
    this.password='',
    this.name='',
    this.gender='',
    this.age='',
    this.country=''
    });

  User copy(
  String email,
  String password,
  String name,
  String gender,
  String age,
  String country,
  ) =>
  User(
    email: email ?? this.email,
    password: password ?? this.password,
    name: name ?? this.name,
    gender: gender ?? this.gender,
    age: age ?? this.age,
    country: country ?? this.country,
  );
}