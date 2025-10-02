import 'package:e_commerce_app/constants.dart';

class UserModel {
  final String userName;
  final String email;
  final String id;
  final String image;

  UserModel({
    required this.userName,
    required this.email,
    required this.id,
    required this.image,
  });

  factory UserModel.fromJson(data) {
    return UserModel(
      userName: data[kUserName],
      email: data[kEmail],
      id: data[kId],
      image: data[kUserImage],
    );
  }
}
