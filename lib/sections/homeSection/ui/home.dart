import 'package:flutter/material.dart';
import 'package:shoopy_test/sections/homeSection/components/single_product.dart';
import 'package:shoopy_test/sections/homeSection/model/products.dart';
import 'package:shoopy_test/sections/homeSection/notifiers/products_notifier.dart';
import '../components/loading_indicator.dart';
import 'package:shoopy_test/utils/constants.dart';
import 'package:shoopy_test/utils/size_config.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProductsNotifier productsNotifier;

  @override
  void initState() {
    super.initState();
    productsNotifier = ProductsNotifier();
    productsNotifier.getMore();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        elevation: 0.0,
        title: Text(
          'Shoopy',
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(child: _homeBody()),
    );
  }

  Widget _homeBody() {
    return ValueListenableBuilder<List<ProductItem>>(
      valueListenable: productsNotifier,
      builder: (context, productList, child) {
        return productList != null
            ? RefreshIndicator(
                onRefresh: () async => await productsNotifier.reload(),
                color: kPrimaryColor,
                child: productList.isEmpty
                    ? Center(
                        child: Text(
                          'No Products!',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                        ),
                      )
                    : NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification scrollInfo) {
                          if (scrollInfo is ScrollEndNotification &&
                              scrollInfo.metrics.extentAfter == 0) {
                            productsNotifier.getMore();
                            return true;
                          }
                          return false;
                        },
                        child: ReorderableListView.builder(
                          itemCount: productList.length,
                          itemBuilder: (context, index) => SingleProduct(
                            key: ValueKey(index),
                            productItem: productList[index],
                          ),
                          onReorder: productsNotifier.reorderData,
                        ),
                      ),
              )
            : Center(
                child: LoadingIndicator(),
              );
      },
    );
  }

  @override
  void dispose() {
    productsNotifier.dispose();
    super.dispose();
  }
}
