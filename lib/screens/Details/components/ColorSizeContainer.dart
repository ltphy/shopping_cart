
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/models/Product.dart';
import 'package:shopping/screens/Details/components/ColorDot.dart';
import 'package:shopping/screens/Details/components/DetailProvider/ColorProvider.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';

class ColorSizeContainer extends StatelessWidget {
  const ColorSizeContainer({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Color"),
                ChangeNotifierProvider<ColorProvider>(
                    create: (context) => ColorProvider(),
                    child: Container(
                      height: 25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: product.colors.length,
                          itemBuilder:
                              (BuildContext context,
                              int index) {
                            return ColorDot(
                              color: product.colors[index],
                              index: index,
                            );
                          }),
                    )),
              ],
            )),
        Expanded(
            child: RichText(
                text: TextSpan(
                    style: TextStyle(color: textColor),
                    children: [
                      TextSpan(text: 'Size \n'),
                      TextSpan(
                          text: "${product.size} cm",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(
                              fontWeight: FontWeight.bold))
                    ])))
      ],
    );
  }
}
