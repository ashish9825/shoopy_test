import 'package:flutter/material.dart';
import 'package:shoopy_test/sections/homeSection/data/repository.dart';

import '../model/products.dart';

class ProductsNotifier extends ValueNotifier<List<ProductItem>> {
  ProductsNotifier() : super(null);

  Repository _repository = Repository();

  int _pageNumber = 0;
  bool _hasMoreProducts = true;
  int _batchesOf = 10;
  List<ProductItem> _products;
  bool _loading = false;

  List<ProductItem> get setValue => value;
  List<ProductItem> value;

  set setValue(List<ProductItem> newProduct) {
    this.value = newProduct;

    notifyListeners();
  }

  Future<void> getMore() async {
    if (_hasMoreProducts && !_loading) {
      _loading = true;
      await fetchProducts(_pageNumber);
      _loading = false;
    }
  }

  Future<void> reload() async {
    _products = <ProductItem>[];
    _pageNumber = 0;
    await fetchProducts(_pageNumber);
  }

  void reorderData(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex = newIndex - 1;
    }
    final items = _products.removeAt(oldIndex);
    _products.insert(newIndex, items);
    setValue = _products;
  }

  Future<void> fetchProducts(int pageNumber) async {
    _products ??= <ProductItem>[];
    int page = pageNumber;

    if (_hasMoreProducts) {
      Products productsList = await _repository.fetchProducts(page);

      productsList != null
          ? _products.addAll(productsList.products)
          : _hasMoreProducts = false;

      page++;
    }

    _pageNumber = page;
    setValue = _products;
  }
}
