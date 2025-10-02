import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> getUserData() async {
    emit(UserLoading());
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;

      final snapshot =
          await FirebaseFirestore.instance.collection(kUser).doc(uid).get();

      if (!snapshot.exists) {
        emit(UserFailure("User not found"));
        return;
      }

      final user = UserModel.fromJson(snapshot.data());
      emit(UserSuccess(user));
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }
}
