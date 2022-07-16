// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuotesModel _$QuotesModelFromJson(Map<String, dynamic> json) => QuotesModel(
      text: json['content'] as String,
      author: json['author'] as String,
    );

Map<String, dynamic> _$QuotesModelToJson(QuotesModel instance) =>
    <String, dynamic>{
      'content': instance.text,
      'author': instance.author,
    };
