import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String email;
  final String name;

  UserModel({this.email, this.name});

  @override
  List<Object> get props => null;
}
