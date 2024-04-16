// one_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_prac_navigation_bars/model/cinema.dart';
import 'package:flutter_prac_navigation_bars/pages/HinkaliSearchDelegate.dart';

class OnePage extends StatefulWidget {
  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  List<Hinkali> cinemas = [
    Hinkali(title: 'Хинкаля 1', category: 'Super', cost: 100.0),
    Hinkali(title: 'Хинкаля 2', category: 'Super', cost: 200.8),
    Hinkali(title: 'Хинкаля 3', category: 'Cold', cost: 400.2),
    Hinkali(title: 'Hinkal 4', category: 'Hot', cost: 500.2),
  ];

  List<String> categories = ['Все', 'Super', 'Cold', 'Hot'];
  String selectedCategory = 'Все';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Хинкали'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context, delegate: HinkaliSearchDelegate(cinemas));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildCategoryChips(),
          _buildMoviesList(),
        ],
      ),
    );
  }

  Widget _buildCategoryChips() {
    return Wrap(
      spacing: 8.0,
      children: categories.map((category) {
        return FilterChip(
          label: Text(category),
          selected: selectedCategory == category,
          onSelected: (bool selected) {
            setState(() {
              selectedCategory = selected ? category : 'Все';
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildMoviesList() {
    List<Hinkali> filteredHinkali = selectedCategory == 'Все'
        ? cinemas
        : cinemas.where((movie) => movie.category == selectedCategory).toList();

    return Expanded(
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        crossFadeState: filteredHinkali.isEmpty
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        firstChild: ListView.builder(
          itemCount: filteredHinkali.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(filteredHinkali[index].title),
              subtitle: Text(
                  'Тип: ${filteredHinkali[index].category}\nЦена: ${filteredHinkali[index].cost}'),
            );
          },
        ),
        secondChild: const Center(
          child: Text('Нет покушать таких'),
        ),
      ),
    );
  }
}
