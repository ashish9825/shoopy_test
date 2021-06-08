import 'package:shoopy_test/sections/homeSection/model/products.dart';
import 'package:shoopy_test/sections/homeSection/network/api_provider.dart';

class Repository {
  ApiProvider _apiProvider = ApiProvider();

  Future<Products> fetchProducts(int pageNumber) async =>
      _apiProvider.fetchProducts(pageNumber: pageNumber);
}
