import 'package:flutter/material.dart';
import 'package:shopping/models/Product.dart';
import 'package:shopping/screens/Details/DetailScreen.dart';
import 'package:shopping/screens/HomeScreen/components/ItemCard.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';

class ItemListCard extends StatefulWidget {
  @override
  _ItemListCardState createState() => _ItemListCardState();
}

class _ItemListCardState extends State<ItemListCard> {
  @override
  Widget build(BuildContext context) {
    print("RERENDER");
    return Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              mainAxisSpacing: defaultPadding,
              crossAxisSpacing: defaultPadding,
            ),
            itemBuilder: (context, index) {
              void onPress() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(product: products[index])));
              }

              return ItemCard(
                product: products[index],
                onPress: onPress,
              );
            }));
  }
}
