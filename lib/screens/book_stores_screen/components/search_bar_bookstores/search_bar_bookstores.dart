import 'package:flutter/material.dart';
import 'package:shopping/constants/constants.dart';
import 'package:shopping/models/book.dart';
import 'package:shopping/models/book_store.dart';
import 'package:shopping/screens/book_detail_screen/book_detail_screen.dart';
import 'package:shopping/screens/books_list_screen/BooksListScreen.dart';

class SearchBarBookStores extends SearchDelegate {
  // String selectedResult;
  BookStore bookStore;
  final List<BookStore> bookStores;
  List<BookStore> recentList = [];

  SearchBarBookStores({this.bookStores});

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

  Widget showSubTitle(List<Book> books) {
    String subTitle = "";
    List<String> texts = books.map((book) => book.title).toList();
    if (texts.length < 2) {
      subTitle = '${texts[0]}.';
    } else {
      subTitle = '${texts[0]}, ${texts[1]},...';
    }
    return Text(subTitle);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<BookStore> suggestionStores = [];
    query.isEmpty
        ? suggestionStores = recentList
        : suggestionStores.addAll(
            bookStores.where((element) => element.name.contains(query)));
    return ListView.builder(
      itemCount: suggestionStores.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(suggestionStores[index].name),
          subtitle: showSubTitle(suggestionStores[index].books),
          onTap: () {
            bookStore = suggestionStores[index];
            // showResults(context);
            Navigator.pushNamed(context, booksList, arguments: bookStore);
          },
        );
      },
    );
  }
}
