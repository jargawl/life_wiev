import 'package:life_wiev/models/QuotesModel/quotes_model.dart';
import 'package:life_wiev/services/Data/DataSources/motivation_quotes_data_sources.dart';

class MotivationQuotesRepositories {
  MotivationQuotesRepositories(
      {required this.motivationQuotesRemoteDioDataSources});
  final MotivationQuotesRemoteDioDataSources
      motivationQuotesRemoteDioDataSources;

  Future<List<QuotesModel>> getQuotesModel() async {
    final json =
        await motivationQuotesRemoteDioDataSources.getQuotesRespondeData();

    if (json == null) {
      return [];
    }

    return json.map((item) => QuotesModel.fromJson(item)).toList();
  }
}
