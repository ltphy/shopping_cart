import 'package:dartis/dartis.dart';
import 'package:shopping/services/redis_client/redis_client.dart';

class SubscribeClient extends RedisClient {
  SubscribeClient(String uri) : super(uri);

  Future<void> subscribeToChannel(String channel,
      Function onReceivedInfo) async {
    try {
      final pubSub = PubSub<String, String>(client.connection);
      pubSub..subscribe(channel: channel);
      pubSub.stream.listen(onReceivedInfo, onError: print);
    } catch (error) {
      throw (error);
    }
  }
}
