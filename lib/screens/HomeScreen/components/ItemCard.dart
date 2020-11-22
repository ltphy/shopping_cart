import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/models/Product.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';
import 'package:shopping/services/provider/SelectedProductProvider.dart';

import 'MyModel.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final String uuid;
  final bool isSelected;

  const ItemCard({this.uuid, this.product, this.isSelected});

  @override
  Widget build(BuildContext context) {
    //have to resize by ratio later
    return Consumer<MyModel>(builder: (context, myModel, child) {
      return GestureDetector(
          onTap: () {
            print("TAP $isSelected");
            print(uuid);
            context.read<SelectedProductProvider>().setSelectedProduct(uuid);
          },
          child: Container(
              decoration: ShapeDecoration(
                  // color: Colors.yellowAccent,
                  shape: Border.all(
                      width: defaultPadding,
                      color: isSelected
                          ? Colors.yellowAccent
                          : Colors.transparent)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                      color: product.color,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(product.image),
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 4),
                    child:
                        Text(product.title, style: TextStyle(color: textColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 4),
                    child: Text('\$ ${product.price.toString()}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 4),
                    child: Text('\$ ${myModel.someValue}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                ],
              )));
    });
  }
}
