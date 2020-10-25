import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/models/Product.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';

import 'MyModel.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function onPress;

  const ItemCard({Key key, this.product, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //have to resize by ratio later
    return Consumer<MyModel>(builder: (context, myModel, child) {
      return GestureDetector(
          onTap: () {
            this.onPress();
          },
          child: Container(
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
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 4),
                child: Text(product.title, style: TextStyle(color: textColor)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 4),
                child: Text('\$ ${product.price.toString()}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 4),
                child: Text('\$ ${myModel.someValue}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              )
            ],
          )));
    });
  }
}
