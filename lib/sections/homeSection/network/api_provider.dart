import 'package:dio/dio.dart';
import 'package:shoopy_test/utils/constants.dart';
import 'package:shoopy_test/utils/utility_functions.dart';
import '../model/products.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<Products> fetchProducts({int pageNumber = 0}) async {
    try {
      Response response = await _dio.get(
          '$API_URL/28052/super-products?online-only=true&child-cat-products=true&page=$pageNumber&size=10&sort=qty,desc');
      print('Products List && Page Number $pageNumber: ${response.data}');
      return Products.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      print('Exception Occured: $error | Stacktrace: $stacktrace');
      return Products.withError(UtilityFunctions.handleError(error));
    }
  }
}
