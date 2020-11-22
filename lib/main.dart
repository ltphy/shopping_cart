import 'package:flutter/material.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';
import 'package:shopping/screens/HomeScreen/HomeScreen.dart';
import 'package:shopping/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/map_screen/map_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      //factories that produce collections of localized values.
      // provides locaized strings and other values
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate, //material components
        GlobalWidgetsLocalizations.delegate, //text direction
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
