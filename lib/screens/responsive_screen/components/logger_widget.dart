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
    // _test(null);
    Logger.enabled = false;
    Logger.config.maxLimit = 50;
    Logger.config.reverse = true;
    Logger.config.printLog = false;
    Logger.config.printNet = false;

    // Set the names in ide print, can use emoji.
    Logger.config.setPrintNames(
      log: "[😄Log]",
      debug: "[🐛Debug]",
      warn: "[❗Warn]",
      error: "[❌Error]",
      request: "[⬆️Req]",
      response: "[⬇️Res]",
    );

    // Set the names in the app, can use emoji.
    Logger.config.setTabNames(
      log: "😄",
      debug: "🐛",
      warn: "❗",
      error: "❌",
      request: "⬆️",
      response: "⬇️",
    );
    //loop through and
    Timer.periodic(const Duration(seconds: 5), _test);
    super.initState();
  }

  void _test(_) {
    print("TEXT");
    Logger.log("This is log");
    // debug
    Logger.debug("this is debug", "this is debug message");
    // warn
    Logger.warn("this is warn", "this is a warning message");
    // error
    Logger.error("this is error", "this is a error message");
    // test error
    try {
      final test = {};
      test["test"]["test"] = 1;
    } catch (a, e) {
      Logger.error(a, e);
    }
    // time test
    Logger.time("timeTest");
    Logger.endTime("timeTest");

    // log net work
    Logger.net(
      "api/user/getUser",
      data: {"user": "yung", "pass": "xxxxxx"},
    );
    Logger.endNet(
      "api/user/getUser",
      data: {
        "users": [
          {"id": 1, "name": "yung", "avatar": "xxx"},
          {"id": 2, "name": "yung2", "avatar": "xxx"}
        ]
      },
    );

    // log net work
    Logger.net("ws/chat/getList", data: {"chanel": 1}, type: "Redis");
    Logger.endNet(
      "ws/chat/getList",
      data: {
        "users": [
          {"id": 1, "name": "yung", "avatar": "xxx"},
          {"id": 2, "name": "yung2", "avatar": "xxx"}
        ]
      },
    );

    // clear log
    // Logger.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Logger();
  }
}
