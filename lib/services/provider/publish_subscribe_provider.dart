import 'dart:convert';

import 'package:dartis/dartis.dart';
import 'package:shopping/constants/constants.dart';
import 'package:shopping/services/logger/file_logger.dart';
import 'package:shopping/services/redis_client/publish_client.dart';
import 'package:shopping/services/redis_client/subscribe_client.dart';

class PublishSubscribeProvider {
  SubscribeClient subClient;
  PublishClient pubClient;

  PublishSubscribeProvider({this.subClient, this.pubClient});

  void onReceivedInfo(var object) {
    print(jsonEncode(object.channel));

    if (object.channel == infoChannel) {
      // print(jsonEncode(object));

      print("HERE");
      print(object.message);
    }
  }

  Future<void> connectToRedis(String uri) async {
    try {
      this.pubClient = new PublishClient(uri);
      await this.pubClient.connectToRedis();

      this.subClient = new SubscribeClient(uri);
      await subClient.connectToRedis();
      await subClient.subscribeToChannel(infoChannel, onReceivedInfo);
      await Lager.log("Connect to $uri");
    } catch (error) {
      throw (error);
    }
  }

  void sendCommandToChannel({var object}) {
    if (pubClient != null) {
      this.pubClient.sendCommand(reqChannel, jsonEncode(object));
    }
  }
}
