import 'package:dio/dio.dart';
import 'package:flutter_news_app/core/utils/constants.dart';

class NewsApiClient {
  final Dio _dio = Dio();
  final String apiKey = Constants.apiKey;

  /// ⚠️ Security Note:
  /// In a real-world project, API calls should go through your own backend server.
  Future<dynamic> fetchNewsByCategory(String category) async {
    final response = await _dio.get(
      '${Constants.baseUrl}/top-headlines',
      queryParameters: {
        'category': category,
        'max': 10,
        'lang': 'en',
        'apikey': apiKey,
      },
    );
    print(response.data);
    return response.data;
  }
}
