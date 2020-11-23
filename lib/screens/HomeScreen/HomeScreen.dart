import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shopping/models/Product.dart';
import 'package:shopping/screens/Details/DetailScreen.dart';
import 'package:shopping/screens/HomeScreen/components/body.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';
import 'package:shopping/screens/UserLogin/UserLogin.dart';
import 'package:shopping/services/provider/ProductListProvider.dart';
import 'package:shopping/services/provider/SelectedProductProvider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var uuid = Uuid();
  PanelController _pc = new PanelController();

  Map<String, Product> productMap = {};
  double panelHeightOpen;

  double panelHeightClosed = 95.0;
  bool isOpen;
  PanelState panelState = PanelState.CLOSED;
  double floatingBtnHeight = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isOpen = false;
    products.forEach((element) {
      String id = uuid.v1();
      productMap[id] = element;
    });
  }

  @override
  Widget build(BuildContext context) {
    panelHeightOpen = MediaQuery.of(context).size.height * 0.22;

    return MultiProvider(
        providers: [
          Provider<ProductListProvider>(
              create: (_) => ProductListProvider(productMap)),
          ChangeNotifierProvider<SelectedProductProvider>(
              create: (_) => SelectedProductProvider())
        ],
        child: Scaffold(
          appBar: buildAppBar(),
          body: SlidingUpPanel(
            onPanelClosed: () {},
            controller: _pc,
            color: Colors.transparent,
            body: Body(),
            maxHeight: panelHeightOpen,
            minHeight: panelHeightClosed,
            backdropOpacity: 0,
            backdropEnabled: true,
            // parallaxOffset: 0.5,
            panel: buildPanel(),
            defaultPanelState: panelState,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.only(
                bottom: floatingBtnHeight,
              ),
              child: Icon(Icons.navigation),
            ),
            backgroundColor: Colors.redAccent,
          ),
        ));
  }

  Container buildPanel() {
    double widthSize = MediaQuery.of(context).size.width;

    return Container(
        child: Column(
      children: [
        Container(
          height: 0.1 * panelHeightOpen,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Icon(
                    Icons.arrow_drop_up_outlined,
                    color: Colors.black,
                  ),
                  color: Colors.transparent)
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(top: panelHeightOpen * 0.1),
                  height: panelHeightOpen * 0.8,
                  width: widthSize * 0.8,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            print("HERE");
                            _pc.close();
                          },
                          child: Container(
                              color: Colors.yellow,
                              padding: EdgeInsets.all(defaultPadding),
                              child: Text(index.toString())));
                    },
                  ))
            ],
          ),
        ),
        Container(
          height: panelHeightOpen * 0.1,
          color: Colors.red,
        ),
      ],
    ));
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
        Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
                icon: Icon(Icons.person),
                color: iconColor,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return UserLogin();
                  }));
                })),
      ],
    );
  }
}
