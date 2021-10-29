import 'package:aquinosolar/app_perfil/module/domain/entities/perfil_credential_entity.dart';
import 'package:aquinosolar/app_perfil/module/domain/entities/perfil_logged_info_entity.dart';
import 'package:aquinosolar/app_perfil/module/domain/errors/perfil_error.dart';
import 'package:aquinosolar/app_perfil/module/domain/repositories/perfil_repository.dart';
import 'package:aquinosolar/app_perfil/module/domain/services/connectivity_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class LoginPhone {
  Future<Either<Failure, PerfilLoggedInfo>> call(
      PerfilCredential perfilcredential);
}

@Injectable(singleton: false)
class LoginPhoneImp implements LoginPhone {
  late final PerfilRepository repository;
  late final ConnectivityService service;

  @override
  Future<Either<Failure, PerfilLoggedInfo>> call(
      PerfilCredential perfilcredential) async {
    if (!perfilcredential.isValidPhone) {
      return Left(ErrorLoginPhone(message: "Telefone invalido"));
    }

    var result = await service.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null!);
    }

    return await repository.loginPhone(phone: perfilcredential.phoneNumber!);
  }
}
