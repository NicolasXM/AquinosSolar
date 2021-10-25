import 'package:equatable/equatable.dart';

class PerfilLogged extends Equatable {
  final String? name;
  final String? email;
  final String? phoneNumber;

  const PerfilLogged({this.name, this.email, this.phoneNumber});

  @override
  List<Object?> get props => [name, email, phoneNumber];
}
