import 'package:json_annotation/json_annotation.dart';

part 'quotes_model.g.dart';

@JsonSerializable()
class QuotesModel {
  QuotesModel({
    required this.text,
    required this.author,
  });

@JsonKey(name: 'content')
  final String text;

  final String author;


  factory QuotesModel.fromJson(Map<String, dynamic> json) => _$QuotesModelFromJson(json);




   Map<String, dynamic> toJson() => _$QuotesModelToJson(this);
}





  // factory QuotesModel.fromJson(Map<String, dynamic> json) {
  //   return QuotesModel(
  //     text: json['content'],
  //     author: json['author'],
  //   );
  // }
