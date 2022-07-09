import 'package:life_wiev/models/QuotesModel/quotes_model.dart';
import 'package:life_wiev/services/Data/DataSources/motivation_quotes_data_sources.dart';

class MotivationQuotesRepositories {
  MotivationQuotesRepositories(this._motivationQuotesRemoteDioDataSources);
  final MotivationQuotesRemoteDioDataSources
      _motivationQuotesRemoteDioDataSources;

  Future<QuotesModel?> getQuotesModel() async {
    final responseData =
        await _motivationQuotesRemoteDioDataSources.getQuotesRespondeData();
    if (responseData == null) {
      return null;
    }

    final author = responseData['author'] as String;
    final text = responseData['text'] as String;
    return QuotesModel(text, author);
  }
}
