import 'package:aquinosolar/app_perfil/module/domain/entities/perfil_logged_info_entity.dart';
import 'package:aquinosolar/app_perfil/module/domain/errors/perfil_error.dart';
import 'package:dartz/dartz.dart';

abstract class PerfilRepository {
  Future<Either<Failure, PerfilLoggedInfo>> loginEmail(
      {String email, String password});

  Future<Either<Failure, PerfilLoggedInfo>> loginPhone({String phone});
  Future<Either<Failure, PerfilLoggedInfo>> verifyPhoneCode(
      {String verificationId, String code});

  Future<Either<Failure, PerfilLoggedInfo>> loggedUser();

  Future<Either<Failure, Unit>> logout();
}
