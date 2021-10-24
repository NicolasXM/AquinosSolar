import 'package:aquinosolar/app_perfil/module/domain/errors/perfil_error.dart';
import 'package:dartz/dartz.dart';

abstract class ConnectivityService {
  Future<Either<Failure, Unit>> isOnline();
}
