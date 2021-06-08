import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoopy_test/sections/homeSection/ui/home.dart';
import 'package:shoopy_test/utils/constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoopy',
      theme: ThemeData(primaryColor: kPrimaryColor, fontFamily: 'Archia'),
      debugShowCheckedModeBanner: false,
      color: kSecondaryColor,
      home: Home(),
    );
  }
}
