import 'package:flutter/material.dart';
import 'package:shopping/models/book.dart';
import 'package:shopping/models/book_store.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';
import 'package:shopping/screens/books_list_screen/BooksListScreen.dart';

class BookstoresItem extends StatelessWidget {
  final BookStore bookStore;

  const BookstoresItem({Key key, this.bookStore}) : super(key: key);

  Widget showSubTitle(List<Book> books) {
    String subTitle = "";
    List<String> texts = books.map((book) => book.title).toList();
    if (texts.length < 2) {
      subTitle = '${texts[0]}.';
    } else {
      subTitle = '${texts[0]},${texts[1]},...';
    }
    return Text(subTitle);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return BooksListScreen(bookStore: bookStore);
          }));
        },
        child: Container(
            decoration: ShapeDecoration(
                shape: Border.all(
              width: 1,
              color: Colors.grey,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Text(bookStore.name,
                        style: Theme.of(context).textTheme.headline6)),
                Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: showSubTitle(bookStore.books))
              ],
            )));
  }
}
