// import 'package:flutter/material.dart';
//
// import 'home_controller.dart';
// import 'home_model.dart';
//
// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   String _searchQuery = '';
//   List<Item> _searchResults = [];
//
//   void _updateSearchResults() {
//     setState(() {
//       _searchResults = searchItems(_searchQuery);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search'),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             onChanged: (value) {
//               setState(() {
//                 _searchQuery = value;
//               });
//               _updateSearchResults();
//             },
//             decoration: InputDecoration(
//               hintText: 'Search...',
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _searchResults.length,
//               itemBuilder: (context, index) {
//                 Item item = _searchResults[index];
//                 return Row(
//                   children: [
//                     Text(item.name),
//                     IconButton(
//                         onPressed: () {},
//                         icon: Icon(Icons.add_circle_outline_rounded))
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   List<Item> searchItems(String query) {
//     // Convert the query to lowercase for case-insensitive search
//     final lowercaseQuery = query.toLowerCase();
//
//     // Filter the itemList based on the query
//     return itemList.where((item) {
//       final lowercaseName = item.name.toLowerCase();
//       final lowercaseDescription = item.description.toLowerCase();
//
//       // Check if either the name or description contains the query
//       return lowercaseName.contains(lowercaseQuery) ||
//           lowercaseDescription.contains(lowercaseQuery);
//     }).toList();
//   }
// }





//
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:stock_watchlist/screen/home/home_controller.dart';
//
// import '../../resources/colors.dart';
// import '../../resources/styles.dart';
// import '../home/home_model.dart';
//
// class Watchlist extends StatefulWidget {
//   Watchlist({Key? key, required this.item}) : super(key: key);
//   final Item item;
//
//   @override
//   State<Watchlist> createState() => _WatchlistState();
// }
//
// final HomeController controller = Get.put(HomeController());
//
// class _WatchlistState extends State<Watchlist> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: Icon(Icons.arrow_back_rounded),
//           ),
//           backgroundColor: colorGreLight,
//           title: Text(
//             'Watchlist',
//             style: blackSemiBold13.copyWith(fontSize: 16.sp),
//           ),
//         ),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: DataTable(
//               columns: [
//                 DataColumn(
//                     label: Text(
//                       'Company',
//                       style: blueSemBold20.copyWith(fontSize: 14.sp),
//                     )),
//                 DataColumn(
//                     label: Text(
//                       'Shared Price',
//                       style: blueLightSemBold20.copyWith(fontSize: 14.sp),
//                     )),
//                 const DataColumn(label: Text('             ')),
//               ],
//               rows: [
//                 DataRow(cells: [
//                   DataCell(Text(
//                     widget.item!.name,
//                     style: blackRegular18.copyWith(fontSize: 12.sp),
//                   )),
//                   DataCell(Text(widget.item.sharedPrice)),
//                   DataCell(IconButton(
//                       onPressed: () {
//                         controller.itemList.remove(widget.item);
//                       },
//                       icon: Icon(Icons.delete))),
//                 ]),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
