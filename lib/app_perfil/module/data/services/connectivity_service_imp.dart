import 'package:flutter_modular/flutter_modular.dart';
import 'package:aquinosolar/app_perfil/module/data/drivers/connectivity_driver.dart';
import 'package:aquinosolar/app_perfil/module/domain/errors/perfil_error.dart';
import 'package:aquinosolar/app_perfil/module/domain/services/connectivity_service.dart';
import 'package:dartz/dartz.dart';

@Injectable(singleton: false)
class ConnectivityServiceImp implements ConnectivityService {
  final ConnectivityDriver driver;

  ConnectivityServiceImp(this.driver);

  @override
  Future<Either<Failure, Unit>> isOnline() async {
    try {
      var check = await driver.isOnline;

      if (check) {
        return Right(unit);
      }

      throw ConnectionError(message: "Você está offline.");
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
          ConnectionError(message: "Erro ao recuperar informação de conexão"));
    }
  }
}
