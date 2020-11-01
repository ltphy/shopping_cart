import 'package:flutter/material.dart';
import 'package:shopping/screens/HomeScreen/SidePanel/UserInfo.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';

class LeftSidePanel extends StatefulWidget {
  final UserInfo userInfo;

  const LeftSidePanel({Key key, this.userInfo}) : super(key: key);

  @override
  _LeftSidePanelState createState() => _LeftSidePanelState();
}

class _LeftSidePanelState extends State<LeftSidePanel> {
  bool isShowPanel;
  bool isShowIcon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isShowPanel = false;
    isShowIcon = true;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Map<String, dynamic> userObj = widget.userInfo.toJson();
    double sideBarWidth = size.width * 0.25;
    return SidePanel(
        expand: isShowPanel,
        sizeBarWidth: sideBarWidth,
        child: Container(
            height: size.height,
            width: sideBarWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Expanded(
                //     child: SidePanel(
                //         expand: isShowPanel,
                //         child: Container(
                //             height: size.height,
                //             color: Colors.yellow,
                //             child: Table(
                //               children: [
                //                 for (var element in userObj.entries)
                //                   TableRow(children: [
                //                     TableCell(child: Text(element.key)),
                //                     TableCell(child: Text(element.value))
                //                   ])
                //               ],
                //             )))),
                // AnimatedContainer(
                //     curve: Curves.fastOutSlowIn,
                //     height: size.height,
                //     width: isShowPanel ? size.width * 0.25 : 0,
                //     color: Colors.yellow,
                //     duration: Duration(milliseconds: 200),
                //     child: Column(
                //       children: [
                //         Container(
                //           decoration: BoxDecoration(
                //               border: Border.all(color: Colors.black, width: 8),
                //               borderRadius: BorderRadius.circular(defaultPadding)),
                //           child: Table(
                //             children: [
                //               for (var element in userObj.entries)
                //                 TableRow(children: [
                //                   TableCell(child: Text(element.key)),
                //                   TableCell(child: Text(element.value))
                //                 ])
                //             ],
                //           ),
                //         ),
                //       ],
                //     )),
                Expanded(
                    flex: 4,
                    child: Container(
                      height: size.height,

                      color: Colors.yellow,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 8),
                                borderRadius:
                                    BorderRadius.circular(defaultPadding)),
                            child: Table(
                              children: [
                                for (var element in userObj.entries)
                                  TableRow(children: [
                                    TableCell(child: Text(element.key)),
                                    TableCell(child: Text(element.value))
                                  ])
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: (size.height * 0.1)),
                      child: Container(
                          color: Colors.yellow,
                          child: IconButton(
                            icon: isShowPanel
                                ? Icon(Icons.arrow_left)
                                : Icon(Icons.arrow_right),
                            onPressed: togglePanel,
                          )),
                    )),
              ],
            )));
  }

  void toggleCollapse() {
    setState(() {
      isShowPanel = false;
    });
  }

  void togglePanel() {
    print("Toggle ${isShowPanel.toString()}");
    setState(() {
      isShowPanel = !isShowPanel;
    });
  }
}

class SidePanel extends StatefulWidget {
  final Widget child;
  final bool expand;
  final double sizeBarWidth;

  const SidePanel({Key key, this.expand, this.child, this.sizeBarWidth})
      : super(key: key);

  @override
  _SidePanelState createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;
  Animation curve;
  @override
  void initState() {
    super.initState();
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    //the animation progress as a non linear curve.
   curve =
        CurvedAnimation(parent: expandController, curve: Curves.linearToEaseOut);
    animation = Tween(begin: 0.2).animate(curve);
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("RERENDER ANIMATION");
    return SizeTransition(
      sizeFactor: animation,
      axis: Axis.horizontal,
      child: widget.child,
      axisAlignment: 1,
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didCHange");
  }

  @override
  void didUpdateWidget(covariant SidePanel oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    expandSideBar();
    // print(oldWidget.expand);
  }

  void expandSideBar() {
    if (widget.expand) {
      animation = Tween(begin: 0.2, end: 1.0).animate(curve);
      print("EXPAND");
      expandController.forward();
    } else {
      print("CLOSE");
      // animation = Tween(begin: 0.2, end: 1.0).animate(curve);
      expandController.reverse();
    }
  }
}

class RightSideExpandedWidget extends StatefulWidget {
  @override
  _RightSideExpandedWidgetState createState() =>
      _RightSideExpandedWidgetState();
}

class _RightSideExpandedWidgetState extends State<RightSideExpandedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
