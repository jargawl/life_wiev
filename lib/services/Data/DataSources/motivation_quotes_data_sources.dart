import 'package:dio/dio.dart';

class MotivationQuotesRemoteDioDataSources {
  Future<List<Map<String, dynamic>>?> getQuotesRespondeData() async {
    final response = await Dio().get<List<dynamic>>(
        'https://my-json-server.typicode.com/jargawl/json/quotes');
    final listDynamic = response.data;
    
    if (listDynamic == null) {
      return null;
    }
    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}
