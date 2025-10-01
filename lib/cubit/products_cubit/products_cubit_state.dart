part of 'products_cubit_cubit.dart';

abstract class DiscoverCubitState {}

class DiscoverCubitInitial extends DiscoverCubitState {}

class DiscoverCubitLoading extends DiscoverCubitState {}

class DiscoverCubitSuccess extends DiscoverCubitState {
  final List<ProductModel> products;
  final List<dynamic> categories;
  DiscoverCubitSuccess(
    this.products,
    this.categories,
  );
}

class DiscoverCubitFailure extends DiscoverCubitState {
  final String errMessage;

  DiscoverCubitFailure(this.errMessage);
}
