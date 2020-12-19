import 'package:dartis/dartis.dart';
import 'package:shopping/services/redis_client/redis_client.dart';

class PublishClient extends RedisClient {
  PublishClient(String uri) : super(uri);

  Future<void> sendCommand(String channel, String value) async {
    try {
      final commands = await this.client.asCommands<String, String>();
      commands.publish(channel, value);
    } catch (error) {
      throw (error);
    }
  }
}
