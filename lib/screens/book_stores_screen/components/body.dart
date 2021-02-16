import 'package:flutter/material.dart';
import 'package:shopping/models/book_store.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';
import 'package:shopping/screens/book_stores_screen/components/search_bar_bookstores/search_bar_bookstores.dart';

import 'bookstores_item/bookstores_item.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        GestureDetector(
            onTap: () => {
                  showSearch(
                      context: context,
                      delegate: SearchBarBookStores(bookStores: bookStores))
                },
            child: Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: ListTile(
                    leading: Icon(Icons.search),
                    title: Text('What bookstores are you looking for?')))),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Bookstore',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold)))),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: bookStores.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              mainAxisSpacing: defaultPadding,
              crossAxisSpacing: defaultPadding,
            ),
            itemBuilder: (BuildContext context, int index) {
              return BookstoresItem(bookStore: bookStores[index]);
            },
          ),
        )),
      ],
    ));
  }
}
