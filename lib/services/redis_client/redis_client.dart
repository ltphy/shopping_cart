import 'package:dartis/dartis.dart';

class RedisClient {
  var client;
  final String uri;

  RedisClient(this.uri);

  Future<void> connectToRedis() async {
    try {
      client = await Client.connect(uri);
    } catch (error) {
      throw (error);
    }
  }

  Future<void> disconnectFromRedis() async {
    try {
      await client.disconnect();
    } catch (error) {
      throw(error);
    }
  }
}
