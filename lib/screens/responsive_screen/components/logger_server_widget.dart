import 'dart:async';

import 'package:flutter/material.dart';
import 'package:let_log/let_log.dart' ;

class LoggerServerWidget extends StatefulWidget {
  @override
  _LoggerServerWidgetState createState() => _LoggerServerWidgetState();
}

class _LoggerServerWidgetState extends State<LoggerServerWidget> {

  void _test(_) {
    // time test
    // Logger.time("timeTest");
    // Logger.endTime("timeTest");


    // log net work


    // clear log
    // Logger.clear();
  }

  @override
  Widget build(BuildContext context) {
    return  NetWidget();
  }
}
