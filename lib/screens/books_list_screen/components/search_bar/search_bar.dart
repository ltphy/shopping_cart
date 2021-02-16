import 'package:flutter/material.dart';
import 'package:shopping/constants/constants.dart';
import 'package:shopping/models/book.dart';
import 'package:shopping/screens/book_detail_screen/book_detail_screen.dart';

class SearchBar extends SearchDelegate {
  // String selectedResult;
  Book selectedBook;
  final List<Book> books;
  List<Book> recentList = [];

  SearchBar({this.books});

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
      RaisedButton(
        child: Text(
          'Cancel',
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Icon(Icons.search_outlined);
  }

  @override
  Widget buildResults(BuildContext context) {
    // return Container(child: Center(child: Text(selectedResult)));
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Book> suggestionBooks = [];
    query.isEmpty
        ? suggestionBooks = recentList
        : suggestionBooks.addAll(books.where((element) =>
    element.author.contains(query) || element.title.contains(query)));
    return ListView.builder(
      itemCount: suggestionBooks.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(suggestionBooks[index].title),
          subtitle: Text(suggestionBooks[index].author),
          onTap: () {
            selectedBook = suggestionBooks[index];
            // showResults(context);
            Navigator.of(context).pop({''});
            // Navigator.pushNamed(context, bookDetail, arguments: selectedBook);
          },
        );
      },
    );
  }
}
