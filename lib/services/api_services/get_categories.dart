import 'package:dio/dio.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/helper/api.dart';

class GetCategoriesService {
  final Dio dio;
  GetCategoriesService(this.dio);

  Future<List<dynamic>> getCategories() async {
    List<dynamic> jsonData = await Api(Dio()).get(
      url: '$kBaseUrl/products/categories',
    );

    return jsonData;
  }
}
