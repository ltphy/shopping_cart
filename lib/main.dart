import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopping/components/progress_indicator/progress_indicator.dart';
import 'package:shopping/generated/l10n.dart';
import 'package:shopping/screens/map_screen/map_screen.dart';
import 'package:shopping/screens/responsive_screen/responsive_screen.dart';
import 'package:shopping/services/logger/file_logger.dart';
import 'package:shopping/services/provider/publish_subscribe_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Future<bool> getSvgImage() async {
    svgDuck = await svg.fromSvgString(smallDuckString, smallDuckString);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        ScreenUtil.init(constraints,
            designSize: Size(1080, 2220), allowFontScaling: false);

        return FutureBuilder(
          future: getSvgImage(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) {
              //progress indicator here.
              return CustomProgressIndicator();
            }
            return MultiProvider(
                providers: [
                  Provider(
                    create: (BuildContext context) =>
                        PublishSubscribeProvider(),
                  ),
                ],
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    fontFamily: 'Georgia',
                    textTheme: TextTheme(
                      headline1: TextStyle(
                          fontSize: 72.0.sp, fontWeight: FontWeight.bold),
                      bodyText1:
                          TextStyle(fontSize: 20.0.sp, color: Colors.black),
                      bodyText2:
                          TextStyle(fontSize: 26.0.sp, color: Colors.black),
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
      },
    );
  }
}
