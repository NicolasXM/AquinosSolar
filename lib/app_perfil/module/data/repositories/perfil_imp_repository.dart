import 'package:aquinosolar/app_perfil/module/data/datasources/login_datasource.dart';
import 'package:aquinosolar/app_perfil/module/domain/errors/perfil_error.dart';
import 'package:aquinosolar/app_perfil/module/domain/entities/perfil_logged_info_entity.dart';
import 'package:aquinosolar/app_perfil/module/domain/repositories/perfil_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

@Injectable(singleton: false)
class PerfilImpRepository implements PerfilRepository {
  final LoginDataSource dataSource;

  PerfilImpRepository(this.dataSource);

  @override
  Future<Either<Failure, PerfilLoggedInfo>> loggedUser() async {
    try {
      var user = await dataSource.currentUser();

      return Right(user);
    } catch (e) {
      return Left(ErrorGetLoggedUser(
          message: "Erro ao tentar recuperar usuario logado"));
    }
  }

  @override
  Future<Either<Failure, PerfilLoggedInfo>> loginEmail(
      {String? email, String? password}) async {
    try {
      var user = await dataSource.loginEmail(email: email, password: password);
      return Right(user);
    } catch (e) {
      return Left(ErrorLoginEmail(message: "Error login with email"));
    }
  }

  @override
  Future<Either<Failure, PerfilLoggedInfo>> loginPhone({String? phone}) async {
    try {
      var user = await dataSource.loginPhone(phone: phone);
      return Right(user);
    } catch (e) {
      return Left(ErrorLoginPhone(message: "Error login with phone."));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await dataSource.logout();
      return Right(unit);
    } catch (e) {
      return Left(ErrorLogout(message: "Error ao tentar fazer logout"));
    }
  }

  @override
  Future<Either<Failure, PerfilLoggedInfo>> verifyPhoneCode(
      {String? verificationId, String? code}) async {
    try {
      var user = await dataSource.validateCode();

      return Right(user);
    } catch (e) {
      return (Left(ErrorLoginPhone(message: "Error login with phone.")));
    }
  }
}
