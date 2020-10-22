import 'package:flutter/material.dart';
import 'package:shopping/models/Product.dart';
import 'package:shopping/screens/HomeScreen/components/ItemCard.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';

class ItemListCard extends StatefulWidget {
  @override
  _ItemListCardState createState() => _ItemListCardState();
}

class _ItemListCardState extends State<ItemListCard> {
  @override
  Widget build(BuildContext context) {
    void onPress() {
      print("OnPress");
    }

    print("RERENDER");
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              mainAxisSpacing: defaultPadding,
              crossAxisSpacing: defaultPadding,
            ),
            itemBuilder: (context, index) => ItemCard(
                  product: products[index],
                  onPress: onPress,
                )));
  }
}
