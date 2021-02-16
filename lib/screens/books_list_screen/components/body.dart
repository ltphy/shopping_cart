import 'package:flutter/material.dart';
import 'package:shopping/models/book.dart';
import 'package:shopping/models/book_store.dart';
import 'package:shopping/screens/books_list_screen/components/search_bar/search_bar.dart';

class Body extends StatefulWidget {
  final BookStore bookStore;

  Body({Key key, this.bookStore}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Book> suggestionBooks = [];

  final searchController = TextEditingController();
  @override
  void dispose() {

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        // GestureDetector(
        //     onTap: () => {
        //           showSearch(
        //               context: context,
        //               delegate: SearchBar(books: bookStore.books))
        //         },
        //     child: Card(
        //         color: Colors.white60,
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(15.0)),
        //         child: ListTile(
        //             leading: Icon(Icons.search),
        //             title: Text('What books are you looking for?')))),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.bookStore.name,
                    style: Theme.of(context).textTheme.headline4))),
        Expanded(
            child: ListView.builder(
          itemCount: this.widget.bookStore.books.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                child: ListTile(
              title: Text(this.widget.bookStore.books[index].title),
            ));
          },
        )),
      ],
    ));
  }
}
