import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoopy_test/utils/constants.dart';
import 'package:shoopy_test/utils/size_config.dart';
import '../model/products.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({Key key, @required this.productItem}) : super(key: key);

  final ProductItem productItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 2,
          vertical: SizeConfig.blockSizeHorizontal * 2),
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 4,
          vertical: SizeConfig.blockSizeHorizontal * 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: productItem.thumbnail,
            progressIndicatorBuilder: (context, url, progress) =>
                _shimmerLoader(),
            height: SizeConfig.blockSizeHorizontal * 15,
            width: SizeConfig.blockSizeHorizontal * 15,
            errorWidget: (context, url, error) => _shimmerLoader(),
          ),
          SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productItem.displayName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: true,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: SizeConfig.blockSizeHorizontal * 2),
                Row(
                  children: [
                    Text(
                      '₹${productItem.salePrice}',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockSizeHorizontal * 4,
                          color: kPrimaryColor),
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
                    Text(
                      '₹${productItem.mrp}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.blockSizeHorizontal * 3,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                 SizedBox(height: SizeConfig.blockSizeHorizontal * 2),
                Container(
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                  child: Text(
                    productItem.catName,
                    style: TextStyle(color: kPrimaryColor, fontSize: SizeConfig.blockSizeHorizontal*2.5 ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _shimmerLoader() {
    return SizedBox(
      height: SizeConfig.blockSizeHorizontal * 15,
      width: SizeConfig.blockSizeHorizontal * 15,
      child: Shimmer.fromColors(
        child: Icon(Icons.image_outlined),
        baseColor: kSecondaryColor,
        highlightColor: kPrimaryColor,
      ),
    );
  }
}
