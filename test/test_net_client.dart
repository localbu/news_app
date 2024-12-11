import 'package:api_vidio/network/net_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Network Test', () {
    test(
      'fetch cnn news',
      () async {
        final netClient = NetClient();
        final response = await netClient.fetchNews(
          newsEndpoint: 'cnn-news',
        );
        print(
          '-------------------------------------------------------------------------------',
        );
        print(
          response.toJson(),
        );
      },
    );
    test(
      'fetch cnn news',
      () async {
        final netClient = NetClient();
        final response = await netClient.fetchNews(
          newsEndpoint: 'cnbc-news',
        );
        print(
          '-------------------------------------------------------------------------------',
        );
        print(
          response.toJson(),
        );
      },
    );
  });
}
