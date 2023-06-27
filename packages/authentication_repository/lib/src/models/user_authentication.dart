// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

/// {@template user}
/// User model
///
/// [UserAuthentication.empty] represents an unauthenticated user.
/// {@end_template}
class UserAuthentication extends Equatable {
  /// {@macro user}
  const UserAuthentication({
    required this.id,
    this.email,
    this.name,
    this.photo =
        'https://www.naneedigital.com/storage/img/images_2/replace_default_user_account_avatar_in_windows_10.png',
  });

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  /// Empty user which represents an unauthenticated user.
  static const empty = UserAuthentication(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == UserAuthentication.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != UserAuthentication.empty;

  @override
  List<Object?> get props => [
        email,
        id,
        name,
        photo,
      ];
}
