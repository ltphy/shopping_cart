import 'package:flutter/material.dart';
import 'package:shopping/screens/HomeScreen/components/categories.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        Categories()
      ],
    ));
  }
}
