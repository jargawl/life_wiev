import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotes_model.freezed.dart';
part 'quotes_model.g.dart';

@freezed
class QuotesModel with _$QuotesModel {
  factory QuotesModel(
    @JsonKey(name: 'content') String text,
    String author,
  ) = _QuotesModel;

  factory QuotesModel.fromJson(Map<String, dynamic> json) =>
      _$QuotesModelFromJson(json);
}


