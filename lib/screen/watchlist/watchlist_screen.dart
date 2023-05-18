import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stock_watchlist/screen/home/home_controller.dart';

import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../home/home_model.dart';

class Watchlist extends StatefulWidget {
  Watchlist({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  State<Watchlist> createState() => _WatchlistState();
}

final HomeController controller = Get.put(HomeController());

class _WatchlistState extends State<Watchlist> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_rounded),
          ),
          backgroundColor: colorGreLight,
          title: Text(
            'Watchlist',
            style: blackSemiBold13.copyWith(fontSize: 16.sp),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: DataTable(
              columns: [
                DataColumn(
                    label: Text(
                  'Company',
                  style: blueSemBold20.copyWith(fontSize: 14.sp),
                )),
                DataColumn(
                    label: Text(
                  'Shared Price',
                  style: blueLightSemBold20.copyWith(fontSize: 14.sp),
                )),
                const DataColumn(label: Text('             ')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Container(
                    width: 100.w,
                    child: Text(
                      widget.item!.name,
                      style: blackRegular18.copyWith(
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  )),
                  DataCell(Container(
                      width: 150.w,
                      child: Text(
                        widget.item.sharedPrice,
                        style: blackRegular18.copyWith(fontSize: 12.sp),
                        textAlign: TextAlign.start,
                      ))),
                  DataCell(IconButton(
                      onPressed: () {
                        controller.itemList.remove(widget.item);
                      },
                      icon: Icon(Icons.delete))),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
