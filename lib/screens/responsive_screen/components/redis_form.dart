import 'package:flutter/material.dart';
import 'package:shopping/services/provider/publish_subscribe_provider.dart';
import 'package:provider/provider.dart';

class RedisForm extends StatefulWidget {
  @override
  _RedisFormState createState() => _RedisFormState();
}

class _RedisFormState extends State<RedisForm> {
  final TextEditingController uriController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    uriController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: uriController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    context
                        .read<PublishSubscribeProvider>()
                        .connectToRedis('redis://127.0.0.1:6379');

                  }
                },
                child: Text('Connect'),
              ),
            ),
          ],
        ));
  }
}
