import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/models/userModel.dart';

final userServiceProvider = Provider((ref) => UserService());

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> createUser(User user, {File? file}) async {
    final ref =
        _firestore.collection('users').doc(user.id.isEmpty ? null : user.id);

    final String? imageUrl = file != null
        ? await (await _storage.ref('images').child(ref.id).putFile(file))
            .ref
            .getDownloadURL()
        : null;

    await ref.set(
      user.copyWith(image: imageUrl).toMap(),
      SetOptions(merge: true),
    );
  }

  Stream<List<User>> get userStream =>
      _firestore.collection('users').snapshots().map(
            (event) => event.docs.map((e) => User.fromFirestore(e)).toList(),
          );

  void delete(String id) {
    _firestore.collection("users").doc(id).delete();
  }
}
