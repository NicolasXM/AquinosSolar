import 'package:meta/meta.dart';

import 'package:aquinosolar/app_perfil/module/domain/entities/perfil_logged_entity.dart';
import 'package:aquinosolar/app_perfil/module/domain/entities/perfil_logged_info_entity.dart';

class UserModel extends PerfilLogged implements PerfilLoggedInfo {
  UserModel({String? name, String? email, String? phoneNumber})
      : super(name: name, email: email, phoneNumber: phoneNumber);

  PerfilLogged toLoggedUser() => this;
}
