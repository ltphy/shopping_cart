import 'package:flutter/material.dart';
import 'package:shopping/constants/constants.dart';
import 'package:shopping/models/book_store.dart';

import 'components/body.dart';

class BookStoresScreen extends StatelessWidget {
  static String routeName = bookStoresRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        onPressed: () {},
        label: Text('Reset settings'),
      ),
      persistentFooterButtons: [
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
