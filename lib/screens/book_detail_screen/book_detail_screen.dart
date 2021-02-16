import 'package:flutter/material.dart';
import 'package:shopping/constants/constants.dart';
import 'package:shopping/models/book.dart';

class BookDetailScreen extends StatelessWidget {
  static String routeName = bookDetail;
  final Book book;

  const BookDetailScreen({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            child: ListTile(
                leading: Icon(Icons.album),
                title: Text(this.book.title),
                subtitle: Text(this.book.author))));
  }
}
