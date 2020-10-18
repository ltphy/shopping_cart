import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping/screens/HomeScreen/components/body.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: Body());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: iconColor,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg", color: iconColor),
            onPressed: () {}),
        Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
                icon:
                    SvgPicture.asset("assets/icons/cart.svg", color: iconColor),
                onPressed: () {})),
      ],
    );
  }
}