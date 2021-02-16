import 'dart:io';

import 'package:dartis/dartis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopping/components/progress_indicator/progress_indicator.dart';
import 'package:shopping/generated/l10n.dart';
import 'package:shopping/models/book_store.dart';
import 'package:shopping/screens/HomeScreen/HomeScreen.dart';
import 'package:shopping/screens/book_stores_screen/book_stores_screen.dart';
import 'package:shopping/screens/books_list_screen/BooksListScreen.dart';
import 'package:shopping/screens/map_screen/map_screen.dart';
import 'package:shopping/screens/responsive_screen/responsive_screen.dart';
import 'package:shopping/screens/unknown_screen/unknown_screen.dart';
import 'package:shopping/services/logger/file_logger.dart';
import 'package:shopping/services/provider/publish_subscribe_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants/constants.dart';
import 'constants/routes.constants.dart';
import 'models/book.dart';
import 'screens/book_detail_screen/book_detail_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Book _selectedBook;
  bool show404 = false;

  Future<bool> getSvgImage() async {
    // svgDuck = await svg.fromSvgString(smallDuckString, smallDuckString);
    return true;
  }

  void _handleBookTapped(Book book) {
    setState(() {
      _selectedBook = book;
    });
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

                  home: BookStoresScreen(),
                  onGenerateRoute: (settings) {
                    if (settings.name == BookDetailScreen.routeName) {
                      // cast the argument to book type
                      final Book book = settings.arguments;
                      return MaterialPageRoute(builder: (context) {
                        return BookDetailScreen(book: book);
                      });
                    } else if (settings.name == BooksListScreen.routeName) {
                      final BookStore bookStore = settings.arguments;
                      return MaterialPageRoute(builder: (context) {
                        return BooksListScreen(
                          bookStore: bookStore,
                        );
                      });
                    }
                    // assert false need to implement or create an unknown page.
                    return null;
                  },
                  routes: {
                    Routes.bookStoresScreen: (context) => BookStoresScreen(),
                  },
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
