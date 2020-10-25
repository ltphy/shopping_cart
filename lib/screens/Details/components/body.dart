import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/models/Product.dart';
import 'package:shopping/screens/Details/components/ColorDot.dart';
import 'package:shopping/screens/Details/components/ColorSizeContainer.dart';
import 'package:shopping/screens/Details/components/DetailProvider/ColorProvider.dart';
import 'package:shopping/screens/Details/components/Information.dart';
import 'package:shopping/screens/Details/components/ProductTitleWithImage.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottom),
          child: Column(
            children: <Widget>[
              SizedBox(
                  height: size.height,
                  child: Stack(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: size.height * 0.3),
                          padding: EdgeInsets.only(
                              top: size.height * 0.12,
                              left: defaultPadding,
                              right: defaultPadding),
                          height: size.height * 0.7,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ColorSizeContainer(product: product),
                              Information()
                            ],
                          )),
                      ProductTitleWithImage(product: this.product),
                    ],
                  )),
            ],
          ),
        ));
  }
}
