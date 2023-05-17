//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// import 'home_model.dart';
//
// class HomeApi {
//   // final ApiClient apiClient;
//   Future<HomeResponse> fetchAlbum(String text) async {
//     final response = await http
//         .get(Uri.parse('https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=BA&apikey=demo'));
//
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       return HomeResponse.fromJson(jsonDecode(response.body));
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load album');
//     }
//   }
// }