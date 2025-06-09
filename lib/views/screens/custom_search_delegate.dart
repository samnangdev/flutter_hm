import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<String> searchTerms = [
    "Louis Vuittion",
    "Chanel",
    "Dior",
    "Gucci",
    "Fandi",
    "Prada",
    "Pedro",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> results =
        searchTerms
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions =
        query.isEmpty
            ? []
            : searchTerms
                .where(
                  (item) => item.toLowerCase().contains(query.toLowerCase()),
                )
                .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          child: ListTile(
            title: Text(suggestions[index]),
            onTap: () {
              query = suggestions[index];
              showResults(context);
            },
          ),
        );
      },
    );
  }
}
