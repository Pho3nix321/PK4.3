// cinema_search_delegate.dart
import 'package:flutter/material.dart';
import 'package:flutter_prac_navigation_bars/model/cinema.dart';

class HinkaliSearchDelegate extends SearchDelegate<String> {
  final List<Hinkali> cinemas;

  HinkaliSearchDelegate(this.cinemas);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Hinkali> searchResults = cinemas
        .where((cinema) =>
            cinema.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildSearchResults(searchResults);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Hinkali> searchResults = cinemas
        .where((cinema) =>
            cinema.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildSearchResults(searchResults);
  }

  Widget _buildSearchResults(List<Hinkali> searchResults) {
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index].title),
          subtitle: Text(
              'Жанр: ${searchResults[index].category}\nРейтинг: ${searchResults[index].cost}'),
        );
      },
    );
  }
}
