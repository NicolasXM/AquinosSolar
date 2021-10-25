import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as validator;

class PerfilCredential {
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? code;
  final String? verificationId;

  PerfilCredential(this.email, this.password, this.phoneNumber, this.code,
      this.verificationId);

  bool get isValidEmail => validator.isEmail(email ?? "");
  bool get isValidPassword => password!.isNotEmpty && password!.length > 5;

  bool get isValidPhone => phoneNumber!.length > 13;

  bool get isValidCode => code!.isNotEmpty;

  bool get isValidVerificationId => verificationId!.isNotEmpty;

  factory PerfilCredential.withEmailAndPassword(
      {@required String? email, required String password}) {
    return PerfilCredential._(email: email, password: password);
  }
}
