import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Row(children: [Text("Search")]),
        ),
      ),
      body: Column(children: [SizedBox(height: 10), _searchBar]),
    );
  }

  Widget get _searchBar {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SearchBar(leading: const Icon(Icons.search)),
    );
  }
}
