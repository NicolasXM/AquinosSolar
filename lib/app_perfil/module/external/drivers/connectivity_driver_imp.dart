import 'package:aquinosolar/app_perfil/module/data/drivers/connectivity_driver.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_modular/flutter_modular.dart';

@Injectable(singleton: false)
class ConnectivityDriverImp implements ConnectivityDriver {
  final Connectivity connectivity;

  ConnectivityDriverImp(this.connectivity);

  @override
  Future<bool> get isOnline async {
    var result = await connectivity.checkConnectivity();
    return result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile;
  }
}
