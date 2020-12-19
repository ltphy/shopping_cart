import 'package:flutter/material.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';

class Information extends StatefulWidget {
  const Information({
    Key key,
  }) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding / 4),
      child: Column(
        children: <Widget>[
          buildInputContainer(context, nameController, "Name"),
          buildInputContainer(context, emailController, "Email"),
          buildInputContainer(context, passwordController, "Password")
        ],
      ),
    );
  }

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
}
