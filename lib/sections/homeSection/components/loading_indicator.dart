import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shoopy_test/utils/constants.dart';
import 'package:shoopy_test/utils/size_config.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitRipple(
        size: SizeConfig.blockSizeHorizontal*15,
        color: kPrimaryColor,
      ),
    );
  }
}