import 'package:movies_app/services/user_service.dart';

import '../models/userModel.dart';
import '../providers/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/loading_provider.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

final createUserProvider =
    ChangeNotifierProvider((ref) => createUserProviderr(ref));

class createUserProviderr extends ChangeNotifier {
  //final Reader _reader;
  final Ref _reader;
  createUserProviderr(this._reader);

  User? _initial;
  User get initial => _initial ?? User.empty().copyWith();
  set initial(User initial) {
    _initial = initial;
  }

  String? get image => initial.image.isNotEmpty ? initial.image : null;

  bool get edit => initial.id.isNotEmpty;

  String? _name;
  String get name => _name ?? initial.name;
  set name(String name) {
    _name = name;
    notifyListeners();
  }

  String? _email;
  String get email => _email ?? initial.email;
  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String? _password;
  String get password => _password ?? initial.password;
  set password(String password) {
    _password = password;
    notifyListeners();
  }

  String? _gender;
  String get gender => _gender ?? initial.gender;
  set gender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  String? _dob;
  String get dob => _dob ?? initial.dob;
  set dob(String dob) {
    _dob = dob;
    notifyListeners();
  }

  File? _file;
  File? get file => _file;
  set file(File? file) {
    _file = file;
    notifyListeners();
  }

  bool get enabled =>
      name.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      gender.isNotEmpty &&
      dob.isNotEmpty &&
      (image != null || file != null);

  Loading get _loading => _reader.read(loadingProvider);

  UserService get _userService => _reader.read(userServiceProvider);

  Future<void> write() async {
    final updated = initial.copyWith(
        name: name, email: email, password: password, gender: gender, dob: dob);
    _loading.start();
    try {
      await _userService.createUser(updated, file: file);
      _loading.stop();
    } catch (e) {
      _loading.end();
      return Future.error("Something error!");
    }
    void clear() {
      _initial = null;
      _name = null;
      _email = null;
      _password = null;
      _gender = null;
      _dob = null;
      _file = null;
    }
  }
}
