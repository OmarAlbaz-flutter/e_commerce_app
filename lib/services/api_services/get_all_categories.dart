import 'package:dio/dio.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/helper/api.dart';
import 'package:e_commerce_app/models/product_model.dart';

class GetAllCategoriesService {
  final Dio dio;
  GetAllCategoriesService(this.dio);

  Future<List<ProductModel>> getAllCategoryProducts(
      {required String categoryName}) async {
    List<dynamic> jsonData =
        await Api(Dio()).get(url: '$kBaseUrl/products/category/$categoryName');

    List<ProductModel> categoryList = [];
    for (int i = 0; i < jsonData.length; i++) {
      ProductModel category = ProductModel.fromJson(
        jsonData[i],
      );
      categoryList.add(category);
    }
    return categoryList;
  }
}
