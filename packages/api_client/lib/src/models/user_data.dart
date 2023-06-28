// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

/// UserData model
@JsonSerializable(explicitToJson: true)
class UserData extends Equatable {
  /// const constructor of the UserData model
  const UserData({
    required this.id,
    required this.isNew,
    required this.email,
    required this.name,
    required this.activeAt,
  });

  /// returns UserData from [json]
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  /// user id
  final String id;

  /// is user a new user (does he has completed data)
  final bool isNew;

  /// user email
  final String email;

  /// user name
  final String name;

  /// Date when user was lastly active.
  final DateTime? activeAt;

  /// returns json from UserData
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  /// returns empty instance of UserData model
  static const empty = UserData(
    id: '',
    isNew: false,
    email: '',
    name: '',
    activeAt: null,
  );

  @override
  List<Object?> get props => [
        id,
        isNew,
        email,
        name,
        activeAt,
      ];

  /// returns the copy of thr given UserData instance with some changes
  UserData copyWith({
    String? id,
    String? token,
    bool? isNew,
    String? email,
    String? name,
    DateTime? activeAt,
  }) {
    return UserData(
      id: id ?? this.id,
      isNew: isNew ?? this.isNew,
      email: email ?? this.email,
      name: name ?? this.name,
      activeAt: activeAt ?? this.activeAt,
    );
  }
}
