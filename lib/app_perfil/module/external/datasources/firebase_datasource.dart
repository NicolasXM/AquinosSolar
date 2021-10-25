import 'dart:async';

import 'package:aquinosolar/app_perfil/module/data/datasources/login_datasource.dart';
import 'package:aquinosolar/app_perfil/module/data/models/user_model.dart';
import 'package:aquinosolar/app_perfil/module/domain/errors/perfil_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

@Injectable(singleton: false)
class FirebaseDataSourceImp implements LoginDataSource {
  final FirebaseAuth auth;
  FirebaseDataSourceImp(this.auth);

  @override
  Future<UserModel> currentUser() async {
    var user = (await auth.currentUser);

    if (user == null) throw ErrorGetLoggedUser();

    return UserModel(
      name: user.displayName,
      email: user.email,
      phoneNumber: user.phoneNumber,
    );
  }

  @override
  Future<UserModel> loginEmail(
      {required String email, required String password}) async {
    var result =
        await auth.signInWithEmailAndPassword(email: email, password: password);

    var user = result.user;

    return UserModel(
        name: user!.displayName,
        phoneNumber: user.phoneNumber,
        email: user.email);
  }

  @override
  Future<UserModel> loginPhone({String? phone}) async {
    var completer = Completer<AuthCredential>();

    await auth.verifyPhoneNumber(
        phoneNumber: phone!,
        verificationCompleted: (auth) {
          completer.complete(auth);
        },
        verificationFailed: (e) {
          completer.completeError(e);
        },
        codeSent: (String c, [int i]) {
          completer.completeError(NotAutomaticRetrieved(c));
        },
        codeAutoRetrievalTimeout: (v) {});
  }

  @override
  Future<void> logout() async {
    return await auth.signOut();
  }

  @override
  Future<UserModel> validateCode({String? verificationId, String? code}) async {
    var _credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId, smsCode: code);

    var user = (await auth.signInWithCredential(_credential)).user;

    return UserModel(
      name: user?.displayName,
      email: user?.email,
      phoneNumber: user?.phoneNumber,
    );
  }
}
