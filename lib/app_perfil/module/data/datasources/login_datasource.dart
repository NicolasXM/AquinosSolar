import 'package:aquinosolar/app_perfil/module/data/models/user_model.dart';

abstract class LoginDataSource {

  Future<UserModel> loginPhone({String phone});


}
