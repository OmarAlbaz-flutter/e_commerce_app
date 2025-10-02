part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}
class CartLoading extends CartState {}
class CartSuccess extends CartState {
  final List<Map<String, dynamic>> items;
  final double total;

  CartSuccess({required this.items, required this.total});
}

class CartFailure extends CartState {
  final String errMessage;
  CartFailure(this.errMessage);
}
