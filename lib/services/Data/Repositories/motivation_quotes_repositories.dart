import 'package:life_wiev/models/QuotesModel/quotes_model.dart';
import 'package:life_wiev/services/Data/DataSources/motivation_quotes_data_sources.dart';

class MotivationQuotesRepositories {
  MotivationQuotesRepositories(this._motivationQuotesRemoteDioDataSources);
  final MotivationQuotesRemoteDioDataSources
      _motivationQuotesRemoteDioDataSources;

  Future<QuotesModel?> getQuotesModel() async {
    final json =
        await _motivationQuotesRemoteDioDataSources.getQuotesRespondeData();
    if (json == null) {
      return null;
    }

    return QuotesModel.fromJson(json);
  }
}
