// GENERATED CODE - DO NOT MODIFY BY HAND



// ignore_for_file: non_constant_identifier_names

part of 'quotes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuotesModel _$$_QuotesModelFromJson(Map<String, dynamic> json) =>
    _$_QuotesModel(
      json['content'] as String,
      json['author'] as String,
    );

Map<String, dynamic> _$$_QuotesModelToJson(_$_QuotesModel instance) =>
    <String, dynamic>{
      'content': instance.text,
      'author': instance.author,
    };
