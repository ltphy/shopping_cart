import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/screens/responsive_screen/components/command_button.dart';
import 'package:shopping/screens/responsive_screen/components/logger_server_widget.dart';
import 'package:shopping/screens/responsive_screen/components/logger_widget.dart';
import 'package:shopping/screens/responsive_screen/components/redis_form.dart';
import 'package:shopping/services/log_info/log_info_list.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        ScreenUtil.init(constraints,
            designSize: Size(1080, 2220), allowFontScaling: false);

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    width: 0.5.sw,
                    height: 200.h,
                    color: Colors.red,
                    child: Text("My width ${0.5.sw} My height: ${200.h}dp",
                        style: Theme.of(context).textTheme.bodyText2),
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 0.5.sw,
                    height: 200.h,
                    child: Text(
                        'My width ${ScreenUtil().screenWidth * 0.5} '
                        'My height ${ScreenUtil().setHeight(200)}',
                        style: Theme.of(context).textTheme.bodyText2),
                  ),
                ],
              ),
              CommandButton(),
              // Container(
              //   height: 800,
              //   child: LoggerWidget(),
              // ),
              // Container(
              //   height: 800,
              //   child: LoggerServerWidget(),
              // )
            ],
          ),
        );
      },
    );
  }
}
