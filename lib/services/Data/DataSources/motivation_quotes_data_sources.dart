import 'package:dio/dio.dart';

class MotivationQuotesRemoteDioDataSources {
  MotivationQuotesRemoteDioDataSources(Dio dio);

  Future<Map<String, dynamic>?> getQuotesRespondeData() async {
    try {
      final response = await Dio()
          .get<Map<String, dynamic>>('https://api.quotable.io/random');
      return response.data;
    } on DioError catch (error) {
      throw Exception(
          error.response?.data['error']['message'] ?? 'Unknow error');
    }
  }
}
