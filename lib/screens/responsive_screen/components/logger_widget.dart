import 'dart:async';

import 'package:flutter/material.dart';
import 'package:let_log/let_log.dart';

class LoggerWidget extends StatefulWidget {
  @override
  _LoggerWidgetState createState() => _LoggerWidgetState();
}

class _LoggerWidgetState extends State<LoggerWidget> {
  @override
  void initState() {
    _test(null);
    Logger.enabled = false;
    Logger.config.maxLimit = 50;
    Logger.config.reverse = true;
    // Logger.config.printLog = false;
    // Logger.config.printNet = false;

    // Set the names in ide print, can use emoji.
    Logger.config.setPrintNames(
      log: "[😄Log]",
      debug: "[🐛Debug]",
      warn: "[❗Warn]",
      error: "[❌Error]",
    );

    // Set the names in the app, can use emoji.
    Logger.config.setTabNames(
      log: "😄",
      debug: "🐛",
      warn: "❗",
      error: "❌",
      request: "Request️",
    );
    //loop through and
    // Timer.periodic(const Duration(seconds: 5), _test);
    super.initState();
  }

  void _test(_) {
    print("TEXT");
    Logger.log("INFO",
        "2020-11-20 19:23:55,749; 1605867835.749; constructed Successfully!");
    // debug
    Logger.debug("this is debug", "this is debug message");
    Logger.debug("this is debug", "this is debug message");

    Logger.debug("this is debug", "this is debug message");

    // warn
    Logger.warn("this is warn", "this is a warning message");
    // error
    Logger.error("this is error", "this is a error message");

    // test error
    // time test
    Logger.time("timeTest");
    Logger.endTime("timeTest");

    Logger.net("api/user/getUser",
        data: {"user": "yung", "pass": "xxxxxx"}, type: "Redis");

    // log net work
    Logger.net("ws/chat/getList", data: {"chanel": 1}, type: "Redis");

    // clear log
    // Logger.clear();
  }

  @override
  Widget build(BuildContext context) {
    return LogWidget();
  }
}
