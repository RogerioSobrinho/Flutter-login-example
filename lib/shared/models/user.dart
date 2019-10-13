import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  String email;
  String name;

  UserModel({this.email, this.name});

  @override
  List<Object> get props => null;

  UserModel.fromJson(Map<String, dynamic> json) {
    this.email = json['email'];
    this.name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.email;
    data['email'] = this.name;
    return data;
  }
}
