import 'package:flutter/material.dart';
import 'package:shopping/models/Product.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';

class ProductTitleWithImage extends StatelessWidget {
  final Product product;

  const ProductTitleWithImage({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Aristocratic Hand Bag", style: TextStyle(color: Colors.white)),
          Text(this.product.title,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          Row(
            children: <Widget>[
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: 'Price \n'),
                TextSpan(
                  text: '\$ ${product.price}',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ])),
              SizedBox(
                width: defaultPadding,
              ),
              Expanded(
                  child: AspectRatio(
                      aspectRatio: 3 / 1,
                      child: Align(
                          alignment: Alignment.center,
                          child: Container(
                              color: Colors.black,
                              child: Image.asset(product.image))))),
            ],
          )
        ],
      ),
    );
  }
}
