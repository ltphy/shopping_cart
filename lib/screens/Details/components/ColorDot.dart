import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/screens/Details/components/DetailProvider/ColorProvider.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';

class ColorDot extends StatelessWidget {
  final Color color;
  final int index;

  const ColorDot({Key key, this.color, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(
      builder: (BuildContext context, colorProvider, Widget child) {
        return GestureDetector(
            onTap: () {
              colorProvider.setSelectedColor(this.index);
            },
            child: Container(
              padding: EdgeInsets.all(2.5),
              margin: EdgeInsets.only(
                  top: defaultPadding / 4, right: defaultPadding / 2),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: colorProvider.selectedColor == this.index
                        ? this.color
                        : Colors.transparent),
              ),
              child: DecoratedBox(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: this.color)),
            ));
      },
    );
  }
}
