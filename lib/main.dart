import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:stock_watchlist/resources/theme.dart';
import 'package:stock_watchlist/screen/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (BuildContext context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: [Locale('en', 'US')],
            builder: (context, widget) => MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!),
            title: 'STOCK WATCHLIST',
            theme: appTheme,
            home: HomeScreen()));
  }
}
