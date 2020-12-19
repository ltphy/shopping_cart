import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/screens/responsive_screen/components/redis_form.dart';
import 'package:shopping/services/provider/publish_subscribe_provider.dart';
import 'package:provider/provider.dart';

class CommandButton extends StatefulWidget {
  @override
  _CommandButtonState createState() => _CommandButtonState();
}

class _CommandButtonState extends State<CommandButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.red)),
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/icons/heart.svg",
              color: Colors.black,
            ),
            Text('Send')
          ],
        ),
      ),
      onPressed: () {
        showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("AlertDialog"),
                content: RedisForm(),
                actions:<Widget>[
                  TextButton(
                    child: Text('Approve'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });

        // context
        //     .read<PublishSubscribeProvider>()
        //     .sendCommandToChannel(object: {});
      },
    );
  }
}
