import 'package:flutter/material.dart';

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
    curve = CurvedAnimation(
        parent: expandController, curve: Curves.linearToEaseOut);
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
