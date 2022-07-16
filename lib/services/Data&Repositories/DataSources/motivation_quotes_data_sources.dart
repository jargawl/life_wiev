import 'package:dio/dio.dart';
import 'package:life_wiev/models/QuotesModel/quotes_model.dart';
import 'package:retrofit/retrofit.dart';


part 'motivation_quotes_data_sources.g.dart';

@RestApi(baseUrl: "https://api.quotable.io")
abstract class MotivationQuotesRemoteRetrofitDataSources {
  factory MotivationQuotesRemoteRetrofitDataSources(Dio dio, {String baseUrl}) = _MotivationQuotesRemoteRetrofitDataSources;

  @GET("/random")
  Future<QuotesModel> getQuotesRespondeData();
}


