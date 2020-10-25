import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomPadding: false, // allow padding without resize UI.
      body: SingleChildScrollView(
          reverse: true, //will let your scroll from bottom to top
          child: Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: Container(
                height: size.height,
                width: size.width,
                child: Column(
                  children: <Widget>[
                    Expanded(flex: 1, child: Container(color: Colors.black12)),
                    Expanded(
                      flex: 3,
                      child: Container(
                          child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                      flex: 4,
                                      child: Container(
                                          color: Colors.orangeAccent)),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: Colors.black,
                                        child: TextField(
                                          maxLines: 100,
                                          style: TextStyle(color: Colors.white),
                                          decoration: InputDecoration(
                                            hintText: "TYPE HERE...",
                                            border: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      )),
                                ],
                              )),
                          Expanded(
                              flex: 3, child: Container(color: Colors.amber)),
                        ],
                      )),
                    )
                  ],
                )),
          )),
    );
  }
}
