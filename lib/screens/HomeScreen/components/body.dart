import 'package:flutter/material.dart';
import 'package:shopping/screens/HomeScreen/components/ItemListCard.dart';
import 'package:shopping/screens/HomeScreen/components/categories.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';
import 'package:provider/provider.dart';

import 'MyModel.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
        create: (context) => MyModel(),
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: defaultPadding),
              child: Text("Women",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            Divider(color: Colors.grey, height: 10),
            Categories(),
            Expanded(child: ItemListCard()),
          ],
        )));
  }
}
