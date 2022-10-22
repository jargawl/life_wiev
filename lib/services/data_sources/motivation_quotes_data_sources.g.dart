// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: no_leading_underscores_for_local_identifiers

part of 'motivation_quotes_data_sources.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _MotivationQuotesRemoteRetrofitDataSources
    implements MotivationQuotesRemoteRetrofitDataSources {
  _MotivationQuotesRemoteRetrofitDataSources(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.quotable.io';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<QuotesModel> getQuotesRespondeData() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<QuotesModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/random',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = QuotesModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
