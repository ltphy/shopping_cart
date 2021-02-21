import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopping/components/search_bar_list/search_bar_list.dart';
import 'package:shopping/models/book.dart';
import 'package:shopping/models/book_store.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatefulWidget {
  final BookStore bookStore;

  Body({Key key, this.bookStore}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    widget.bookStore.books.addAll(List<Book>.generate(
        1000, (index) => Book("Phy world's $index", "Phy Lieng $index")));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SearchBarList<Book>(
      filter: (Book book) {
        return [book.title, book.author];
      },
      items: widget.bookStore.books,
      failure: Center(child: Text('No Item')),
      builder: (Book book) {
        return Card(
            child: ListTile(
          title: Text(book.title),
          subtitle: Text(book.author),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                // suggestionBooks[index].title =
                //     '${suggestionBooks[index].title} changed';
                // same book ref to thesame location
                int idx = widget.bookStore.books.indexOf(book);
                // suggestionBooks.removeAt(index);
                widget.bookStore.books.removeAt(idx);
              });
            },
          ),
        ));
      },
    ));
    // return Container(
    //     child: Column(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: TextField(
    //         controller: searchController,
    //         onChanged: (value) {
    //           filterSearchResults(value);
    //         },
    //         decoration: InputDecoration(
    //             hintText: "Search",
    //             prefixIcon: Icon(Icons.search),
    //             suffixIcon: IconButton(
    //               icon: Icon(Icons.close),
    //               onPressed: () {
    //                 searchController.text = "";
    //                 filterSearchResults("");
    //               },
    //             ),
    //             focusedBorder: OutlineInputBorder(
    //                 borderRadius:
    //                     BorderRadius.all(Radius.circular(defaultPadding)),
    //                 borderSide:
    //                     BorderSide(color: Theme.of(context).accentColor)),
    //             border: OutlineInputBorder(
    //                 borderSide:
    //                     BorderSide(color: Theme.of(context).accentColor),
    //                 borderRadius:
    //                     BorderRadius.all(Radius.circular(defaultPadding)))),
    //       ),
    //     ),
    //
    //     Padding(
    //         padding: EdgeInsets.all(defaultPadding.w),
    //         child: Align(
    //             alignment: Alignment.centerLeft,
    //             child: Text(widget.bookStore.name,
    //                 style: Theme.of(context).textTheme.headline4))),
    //     Expanded(
    //         child: ListView.builder(
    //       itemCount: suggestionBooks.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         return Card(
    //             child: ListTile(
    //           title: Text(suggestionBooks[index].title),
    //           subtitle: Text(suggestionBooks[index].author),
    //           trailing: IconButton(
    //             icon: Icon(Icons.delete),
    //             onPressed: () {
    //               setState(() {
    //                 suggestionBooks[index].title =
    //                     '${suggestionBooks[index].title} changed';
    //                 // same book ref to thesame location
    //                 int idx =
    //                     widget.bookStore.books.indexOf(suggestionBooks[index]);
    //
    //                 suggestionBooks.removeAt(index);
    //                 widget.bookStore.books.removeAt(idx);
    //               });
    //             },
    //           ),
    //         ));
    //       },
    //     )),
    //   ],
    // ));
  }
}
