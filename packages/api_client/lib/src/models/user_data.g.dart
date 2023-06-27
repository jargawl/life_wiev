// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as String,
      isNew: json['isNew'] as bool,
      email: json['email'] as String,
      name: json['name'] as String,
      activeAt: json['activeAt'] == null
          ? null
          : DateTime.parse(json['activeAt'] as String),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'isNew': instance.isNew,
      'email': instance.email,
      'name': instance.name,
      'activeAt': instance.activeAt?.toIso8601String(),
    };
