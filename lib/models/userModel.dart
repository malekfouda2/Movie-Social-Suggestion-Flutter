import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String gender;
  final String dob;
  final String image;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.gender,
      required this.dob,
      required this.image});

  User copyWith(
      {String? id,
      String? name,
      String? email,
      String? password,
      String? gender,
      String,
      dob,
      String? image}) {
    return User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        gender: gender ?? this.gender,
        dob: dob ?? this.dob,
        image: image ?? this.image);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'dob': dob,
      'image': image,
    };
  }

  factory User.fromFirestore(DocumentSnapshot doc) {
    final Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
    return User(
      id: doc.id,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      gender: map['gender'] ?? '',
      dob: map['dob'] ?? '',
      image: map['image'] ?? '',
    );
  }

  factory User.empty() => User(
      id: '',
      name: '',
      email: '',
      password: '',
      gender: '',
      dob: '',
      image: '');
}
