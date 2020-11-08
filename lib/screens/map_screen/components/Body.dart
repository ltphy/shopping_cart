import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping/screens/HomeScreen/SidePanel/SidePanel.dart';
import 'package:shopping/screens/map_screen/map_screen.constants.dart';
import 'package:shopping/screens/map_screen/map_screen.dart';
import 'package:shopping/screens/map_screen/model/location_info.dart';
import 'package:shopping/screens/map_screen/model/location_point.dart';
import 'package:shopping/screens/map_screen/painter/location_painter.dart';
import 'package:shopping/screens/map_screen/painter/marker_painter.dart';
import 'package:provider/provider.dart';
import 'package:shopping/services/provider/LocationProvider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey _targetKey = GlobalKey();
  LocationMap locationMap;
  final TransformationController _transformationController =
      TransformationController();

  void _onTapUp(TapUpDetails details) {
    final renderBox = _targetKey.currentContext.findRenderObject() as RenderBox;
    print("RENDER BOX ${renderBox.size.width}");
    final offset =
        details.globalPosition - renderBox.localToGlobal(Offset.zero);
    final scenePoint = _transformationController.toScene(offset);
    print("x: ${scenePoint.dx}, y: ${scenePoint.dy}");
    LocationPoint locationPoint =
        locationMap.getLocationPointFromOffset(scenePoint);
    context.read<LocationProvider>().updateSourceLocation(locationPoint);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ListLocationInfo locationList = ListLocationInfo.fromJson(objJson);
    locationMap =
        LocationMap(locationInfoList: locationList.locationInfo, size: size);
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
                    child: Stack(children: [
                      RepaintBoundary(
                          child: CustomPaint(
                        painter: LocationPainter(locationMap),
                      )),
                      CustomPaint(
                          painter:
                              MarkerPainter(context.watch<LocationProvider>()),
                          child: Container()),
                    ]),
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
