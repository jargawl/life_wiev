import 'package:dio/dio.dart';

class MotivationQuotesRemoteDioDataSources {
  Future<Map<String,dynamic>?> getQuotesRespondeData() async {
    final response =
        await Dio().get<Map<String, dynamic>>('https://type.fit/api/quotes');
    return response.data;
  
  }
}
