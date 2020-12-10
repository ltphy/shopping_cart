import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopping/generated/l10n.dart';
import 'package:shopping/screens/map_screen/map_screen.dart';
import 'package:shopping/screens/responsive_screen/responsive_screen.dart';
import 'package:shopping/services/logger/file_logger.dart';
import 'package:shopping/services/provider/publish_subscribe_provider.dart';
import 'package:path_provider/path_provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        ScreenUtil.init(constraints,
            designSize: Size(1080, 2220), allowFontScaling: false);

        return MultiProvider(
            providers: [
              Provider(
                create: (BuildContext context) => PublishSubscribeProvider(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                fontFamily: 'Georgia',
                textTheme: TextTheme(
                  headline1:
                      TextStyle(fontSize: 72.0.sp, fontWeight: FontWeight.bold),
                  bodyText1: TextStyle(fontSize: 20.0.sp, color: Colors.black),
                  bodyText2: TextStyle(fontSize: 26.0.sp, color: Colors.black),
                ),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: MapScreen(),
              //factories that produce collections of localized values.
              // provides locaized strings and other values
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate, //material components
                GlobalWidgetsLocalizations.delegate, //text direction
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
            ));
      },
    );
  }
}
