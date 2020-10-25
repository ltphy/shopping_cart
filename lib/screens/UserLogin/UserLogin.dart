import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;

  Column buildInputContainer(
      BuildContext context, TextEditingController controller, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: Theme.of(context).textTheme.bodyText1),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'What do people call you?',
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<void> showInfoDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                buildInputContainer(context, nameController, "Name"),
                buildInputContainer(context, emailController, "Email"),
                buildInputContainer(context, passwordController, "Password")
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                // FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus.unfocus();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
                                          padding: EdgeInsets.zero,
                                          color: Colors.orangeAccent,
                                          child: MaterialButton(
                                            color: Colors.white,
                                            shape: CircleBorder(),
                                            child: Icon(
                                              Icons.add,
                                              size: 24,
                                            ),
                                            onPressed: () {
                                              showInfoDialog();
                                            },
                                          ))),
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
