import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stock_watchlist/resources/colors.dart';
import '../../resources/dimensions.dart';
import '../../resources/styles.dart';
import '../watchlist/watchlist_screen.dart';
import 'home_controller.dart';
import 'home_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';
  List<Item> _searchResults = [];
  TextEditingController searchController = TextEditingController();

  void _updateSearchResults() {
    setState(() {
      _searchResults = searchItems(_searchQuery);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorLightYellow,
          title: Text(
            'Trade Brains',
            style: blackSemiBold13.copyWith(fontSize: 16.sp),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(mobilePadding),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: searchController,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  prefix: IconButton(onPressed: (){},icon: Icon(Icons.search),),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(bottom: 2.w),),
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchController.clear();
                    },
                    icon: Icon(
                      Icons.clear,
                      size: 18.w,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: 'Search',
                  // hintStyle: Text(""),
                  filled: true,
                  fillColor: colorWhite,
                  contentPadding: const EdgeInsets.only(
                    left: 14.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: colorWhite),
                    borderRadius: BorderRadius.circular(7.w),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: colorWhite),
                    borderRadius: BorderRadius.circular(7.w),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: colorWhite),
                    borderRadius: BorderRadius.circular(7.w),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: colorWhite),
                    borderRadius: BorderRadius.circular(7.w),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                  _updateSearchResults();
                },
              ),
              SizedBox(
                height: 20.w,
              ),
              Expanded(
                //  height: 300,
                child: Container(decoration: BoxDecoration(color: colorLightBrown,borderRadius: BorderRadius.circular(10.w)),
                  child: ListView.separated(padding: EdgeInsets.all(15.w),
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      Item item = _searchResults[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(item.name,style: blackRegular18.copyWith(fontSize: 13.sp),),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Watchlist(
                                        item: item,
                                      ),
                                    ));
                              },
                              icon: Icon(Icons.add_circle_outline_rounded))
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      height: 20.w,
                      color: colorBlack,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
      ),
    );
  }

  List<Item> searchItems(String query) {
    final HomeController controller = Get.put(HomeController());
    final lowercaseQuery = query.toLowerCase();

    return controller.itemList.where((item) {
      final lowercaseName = item.name.toLowerCase();
      final lowercaseDescription = item.sharedPrice.toLowerCase();

      return lowercaseName.contains(lowercaseQuery) ||
          lowercaseDescription.contains(lowercaseQuery);
    }).toList();
  }
}
