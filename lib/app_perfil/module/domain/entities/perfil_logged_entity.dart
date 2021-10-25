import 'package:equatable/equatable.dart';

class PerfilLogged extends Equatable {
  final String? name;
  final String? email;
  final String? phoneNumber;

  PerfilLogged(this.name, this.email, this.phoneNumber, {String? email});

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, phoneNumber];
}
