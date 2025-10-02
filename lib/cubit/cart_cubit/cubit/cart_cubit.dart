import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final user = FirebaseAuth.instance.currentUser;

  Future<void> getCartItem() async {
    try {
      emit(CartLoading());

      final snapshot = await FirebaseFirestore.instance
          .collection(kUser)
          .doc(user!.uid)
          .collection(kCart)
          .get();

      double total = 0;
      final items = snapshot.docs.map((doc) {
        final data = doc.data();
        data[kDocId] = doc.id;

        final price = (data['price'] ?? 0) as num;
        total += price;

        return data;
      }).toList();

      emit(CartSuccess(items: items, total: total.toDouble()));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }
}
