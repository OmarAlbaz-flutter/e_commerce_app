part of 'user_cubit.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserModel userModel;

  UserSuccess(this.userModel);
}

class UserFailure extends UserState {
  final String errMessage;

  UserFailure(this.errMessage);
}
