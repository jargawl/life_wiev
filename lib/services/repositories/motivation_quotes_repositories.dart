import 'package:life_view/models/quotes_model.dart';
import '../services.dart';

class MotivationQuotesRepositories {
  MotivationQuotesRepositories(
      {required this.motivationQuotesRemoteDioDataSources});
  final MotivationQuotesRemoteRetrofitDataSources
      motivationQuotesRemoteDioDataSources;

  Future<QuotesModel?> getQuotesModel() async {
    return motivationQuotesRemoteDioDataSources.getQuotesRespondeData();
  }
}
