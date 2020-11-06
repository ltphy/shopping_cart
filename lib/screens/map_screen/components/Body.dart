import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping/screens/HomeScreen/SidePanel/SidePanel.dart';
import 'package:shopping/screens/map_screen/components/marker_painter.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey _targetKey = GlobalKey();

  final TransformationController _transformationController =
      TransformationController();

  void _onTapUp(TapUpDetails details) {
    final renderBox = _targetKey.currentContext.findRenderObject() as RenderBox;
    print("RENDER BOX ${renderBox.size.width}");
    final offset =
        details.globalPosition - renderBox.localToGlobal(Offset.zero);
    final scenePoint = _transformationController.toScene(offset);
    print("x: ${scenePoint.dx}, y: ${scenePoint.dy}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Draw the scene as big as is available, but allow the user to
          // translate beyond that to a visibleSize that's a bit bigger.

          final viewportSize = Size(
            constraints.maxWidth,
            constraints.maxHeight,
          );
          print("VIEW PORT SIZE ${viewportSize.width} ${viewportSize.height}");
          // Start the first render, start the scene centered in the viewport.

          return Stack(children: [
            ClipRect(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapUp: _onTapUp,
                child: InteractiveViewer(
                  key: _targetKey,
                  transformationController: _transformationController,
                  boundaryMargin: EdgeInsets.symmetric(
                    horizontal: viewportSize.width,
                    vertical: viewportSize.height,
                  ),
                  minScale: 0.01,
                  // onInteractionStart: _onScaleStart,
                  child: SizedBox.expand(
                    child: RepaintBoundary(
                        child: CustomPaint(
                      painter: MarkerPainter(),
                    )),
                  ),
                ),
              ),
            ),
            // LeftSidePanel(userInfo: userInfo),
          ]);
        },
      ),
    );
  }
}
