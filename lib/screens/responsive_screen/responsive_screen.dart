import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/body.dart';
import 'package:logging/logging.dart';

class ResponsiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context,
    //     designSize: Size(1080, 2220), allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(title: Text('Responsive App')),
      body: Body(),
    );
  }
}
