import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';

/// class represents User and store all user properties
class User extends Equatable {
  /// const constructor of the User instance.
  const User({
    required this.id,
    required this.isNew,
    required this.email,
    required this.name,
    
    required this.activeAt,
    
  });

  /// returns User instance from UserData
  factory User.fromData(UserData data) => User(
        id: data.id,
        isNew: data.isNew,
        email: data.email,
        name: data.name,
     
        activeAt: data.activeAt,

      );

  /// returns the UserData instance from User model
  UserData toData() => UserData(
        id: id,
        isNew: isNew,
        email: email,
        name: name,

        activeAt: activeAt,
        
      );

  /// user id [String]
  final String id;

  /// returns 'true' is the user is new [bool]
  final bool isNew;

  /// user email [String] which he was authenticated. It can be only one such
  /// an email in database.
  final String email;

  /// name of the user [String]
  final String name;

 
  /// Date when user was lastly active.
  final DateTime? activeAt;

  /// returns empty instance of the User class
  static const empty = User(
    id: '',
    isNew: false,
    email: '',
    name: '',
   
    activeAt: null,
   
  );

  @override
  List<Object> get props {
    return [
      id,
      isNew,
      email,
      name,
    
      activeAt ?? DateTime.now(),
     
    ];
  }

  /// returns the instance of the User based on the other user
  /// and given properties that have to be changed.
  User copyWith({
    String? id,
    bool? isNew,
    String? email,
    String? name,
   
    DateTime? activeAt,
   
  }) {
    return User(
      id: id ?? this.id,
      isNew: isNew ?? this.isNew,
      email: email ?? this.email,
      name: name ?? this.name,
     
      activeAt: activeAt ?? this.activeAt,
   
    );
  }

 
}
