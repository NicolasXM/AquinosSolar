import 'package:aquinosolar/app_perfil/module/data/datasources/login_datasource.dart';
import 'package:aquinosolar/app_perfil/module/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

@Injectable(singleton: false)
class FirebaseDataSourceImp implements LoginDataSource {
  final FirebaseAuth auth;
  FirebaseDataSourceImp(this.auth);

  @override
  Future<UserModel> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
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
  Future<UserModel> loginPhone({String phone}) {
    // TODO: implement loginPhone
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UserModel> validateCode({String verificationId, String code}) {
    // TODO: implement validateCode
    throw UnimplementedError();
  }
}
