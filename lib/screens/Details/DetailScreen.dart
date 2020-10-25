import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping/models/Product.dart';
import 'package:shopping/screens/Details/components/body.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: product.color,
      body: Body(product: this.product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg",
                color: Colors.white),
            onPressed: () {}),
        Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
                icon: SvgPicture.asset("assets/icons/cart.svg",
                    color: Colors.white),
                onPressed: () {})),
      ],
    );
  }
}
