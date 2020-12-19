import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';

import 'MyModel.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Hand bag", "Jewellery", "Footwear", "Dresses"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int index) {
            return buildCategory(index);
          },
          separatorBuilder: (context, int index) => SizedBox(width: 10),
          itemCount: categories.length),
    );
  }

  Widget buildCategory(int index) {
    return Consumer<MyModel>(builder: (context, myModel, child) {
      return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            myModel.doSomething();
          },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    categories[index],
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    width: 30,
                    height: 2,
                    color: selectedIndex == index
                        ? Colors.black
                        : Colors.transparent,
                  )
                ],
              )));
    });
  }
}
