import 'package:dio/dio.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/api_services/get_all_products.dart';
import 'package:e_commerce_app/services/api_services/get_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_cubit_state.dart';

class DiscoverCubit extends Cubit<DiscoverCubitState> {
  DiscoverCubit() : super(DiscoverCubitInitial());

  Future<void> fetchAllProducts() async {
    try {
      emit(DiscoverCubitLoading());
      final products = await GetAllProductsService(Dio()).getAllProducts();
      final categories = await GetCategoriesService(Dio()).getCategories();
      emit(DiscoverCubitSuccess(products, categories));
    } catch (e) {
      emit(DiscoverCubitFailure(e.toString()));
    }
  }
}
