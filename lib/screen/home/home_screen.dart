import 'package:flutter/material.dart';
import '../watchlist/watchlist_screen.dart';
import 'home_controller.dart';
import 'home_model.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';
  List<Item> _searchResults = [];
  List<Item> wishlistItems = [];

  void _updateSearchResults() {
    setState(() {
      _searchResults = searchItems(_searchQuery);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
              _updateSearchResults();
            },
            decoration: InputDecoration(
              hintText: 'Search...',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                Item item = _searchResults[index];
                return Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => WhisListScreen(),
                          ));
                        },
                        child: Text(item.name)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_circle_outline_rounded))
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Item> searchItems(String query) {
    final lowercaseQuery = query.toLowerCase();

    return itemList.where((item) {
      final lowercaseName = item.name.toLowerCase();
      final lowercaseDescription = item.description.toLowerCase();

      return lowercaseName.contains(lowercaseQuery) ||
          lowercaseDescription.contains(lowercaseQuery);
    }).toList();
  }
}
