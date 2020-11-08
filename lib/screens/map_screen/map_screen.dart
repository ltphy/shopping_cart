import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/screens/map_screen/components/Body.dart';
import 'package:shopping/services/provider/LocationProvider.dart';
import 'package:shopping/services/provider/ShowPanelProvider.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => ShowPanelProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => LocationProvider()),
      ],
      child: Scaffold(body: Body()),
    );
  }
}
