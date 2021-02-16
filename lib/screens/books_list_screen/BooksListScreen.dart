import 'package:flutter/material.dart';
import 'package:shopping/constants/constants.dart';
import 'package:shopping/models/book_store.dart';

import 'components/body.dart';

class BooksListScreen extends StatelessWidget {
  static String routeName = booksList;
  final BookStore bookStore;

  const BooksListScreen({Key key, @required this.bookStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Body(bookStore: bookStore));
  }
}
