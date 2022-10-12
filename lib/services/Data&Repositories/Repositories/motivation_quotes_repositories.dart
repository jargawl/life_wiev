import 'package:life_view/models/quotes_model.dart';
import 'package:life_view/services/Data&Repositories/DataSources/motivation_quotes_data_sources.dart';

class MotivationQuotesRepositories {
  MotivationQuotesRepositories(
      {required this.motivationQuotesRemoteDioDataSources});
  final MotivationQuotesRemoteRetrofitDataSources
      motivationQuotesRemoteDioDataSources;

  Future<QuotesModel?> getQuotesModel() async {
    return motivationQuotesRemoteDioDataSources.getQuotesRespondeData();
  }
}
