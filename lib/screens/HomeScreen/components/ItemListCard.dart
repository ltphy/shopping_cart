import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/models/Product.dart';
import 'package:shopping/screens/Details/DetailScreen.dart';
import 'package:shopping/screens/HomeScreen/components/ItemCard.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';
import 'package:shopping/services/provider/ProductListProvider.dart';
import 'package:shopping/services/provider/SelectedProductProvider.dart';

class ItemListCard extends StatefulWidget {
  @override
  _ItemListCardState createState() => _ItemListCardState();
}

class _ItemListCardState extends State<ItemListCard> {
  @override
  Widget build(BuildContext context) {
    //item list card =>
    return Consumer<ProductListProvider>(
      builder: (BuildContext context, productsListProvider, Widget child) {
        return Container(
            padding: EdgeInsets.all(10),
            child: GridView.builder(
                itemCount: productsListProvider.selectedProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                ),
                itemBuilder: (context, index) {

                  String key = productsListProvider.selectedProducts.keys
                      .elementAt(index);
                  return ItemCard(
                    product: productsListProvider.selectedProducts.values
                        .elementAt(index),
                    isSelected:
                        key == context.watch<SelectedProductProvider>().uuid,
                    uuid: key,
                  );
                }));
      },
    );
  }
}
