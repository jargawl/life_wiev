// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:api_client/api_client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Exception thrown when searchTripsByCriteria method fails.
class SearchTripsByCriteriaFailure implements Exception {}

/// Exception thrown when getChatData method fails.
class GetChatDataFailure implements Exception {}

/// Exception thrown when refreshAuthenticatedUser method fails.
class RefreshAuthenticatedUserFailure implements Exception {}

/// Exception thrown when getUser method fails.
class GetUserFailure implements Exception {}

/// Exception thrown when setUser method fails.
class SetUserFailure implements Exception {}

/// Exception thrown when setUserToken method fails.
class SetTokenFailure implements Exception {}

/// Exception thrown when updateToken method fails.
class UpdateTokenFailure implements Exception {}

/// Exception thrown when removeToken method fails.
class RemoveTokenFailure implements Exception {}

/// Exception thrown when updateUser method fails.
class UpdateUserFailure implements Exception {}

/// Exception thrown when _docToUserData method fails.
class UserDataDeserializationFailure implements Exception {}

/// Exception thrown when _getTripFromDocument method fails.
class TripDataDeserializationFailure implements Exception {}

/// Exception thrown when addNewTrip method fails.
class SaveTripFailure implements Exception {}

/// Exception thrown when clearUserTripDraft method fails.
class ClearUserTripDraftFailure implements Exception {}

/// Exception thrown when deleteTrip method fails.
class DeleteTripFailure implements Exception {}

/// Exception thrown when getTripById method fails.
class GetTripByIdFailure implements Exception {}

/// Exception thrown when isTripExisting method fails.
class IsTripExistingFailure implements Exception {}

/// Exception thrown when getTripsList method fails.
class GetTripsListFailure implements Exception {}

/// Exception thrown when joinTrip method fails.
class JoinTripFailure implements Exception {}

/// Exception thrown when getTransport method fails.
class GetTransportFailure implements Exception {}

/// Exception thrown when addHobby method fails.
class AddHobbyFailure implements Exception {}

/// Exception thrown when getHobby method fails.
class GetHobbyFailure implements Exception {}

/// Exception thrown when getHobbiesList method fails.
class GetHobbiesListFailure implements Exception {}

/// Exception thrown when joinUserChat method fails.
class JoinUserChatFailure implements Exception {}

/// Exception thrown when joinTripChat method fails.
class JoinTripChatFailure implements Exception {}

/// Exception thrown when findUserChat method fails.
class FindUserChatFailure implements Exception {}

/// Exception thrown when createUserChat method fails.
class CreateUserChatFailure implements Exception {}

/// Exception thrown when createTripChat method fails.
class CreateTripChatFailure implements Exception {}

/// Exception thrown when saveTransport method fails.
class SaveTransportFailure implements Exception {}

/// Exception thrown when setChatProperties method fails.
class SetChatProperties implements Exception {}

/// Exception thrown when sendMessage method fails.
class SendMessageFailure implements Exception {}

/// Exception thrown when _chatDataFromDocument method fails.
class ChatDataDeserializationFailure implements Exception {}

/// Exception thrown when _messageDataFromDocument method fails.
class MessageDataDeserializationFailure implements Exception {}

/// Exception thrown when getChatMessages method fails.
class GetChatMessagesFailure implements Exception {}

///  Exception thrown when sendNotification method fails.
class SendNotificationsFailure implements Exception {}

class ApiClient {
  ApiClient({required this.firebaseFirestore});
  final FirebaseFirestore firebaseFirestore;

  final StreamController<UserData> _loadedAuthenticatedUser =
      StreamController<UserData>();

  var _cacheLoginUser = UserData.empty;

  String loginUserId = '';

  void dispose() {
    _loadedAuthenticatedUser.close();
  }

  // User

  Future<void> addNewUser({
    required String? id,
    required String email,
    required String name,
    required String photo,
  }) async {
    if (id != null) {
      final userData = UserData.empty.copyWith(
        id: id,
        isNew: true,
        email: email,
        name: name,
        activeAt: DateTime.now(),
      );
      await setUser(user: userData);
    }
  }

  Future<void> setUser({
    required UserData user,
  }) async {
    try {
      await firebaseFirestore.collection('users').doc(user.id).set(
            user.toJson(),
          );
    } catch (e) {
      SetUserFailure();
    }
  }

  Future<void> updateUser({
    required UserData user,
  }) async {
    try {
      await firebaseFirestore.collection('users').doc(user.id).update(
            user.toJson(),
          );
    } catch (e) {
      UpdateUserFailure();
    }
  }

  void refreshAuthenticatedUser() {
    if (loginUserId != '') {
      try {
        firebaseFirestore
            .collection('users')
            .doc(loginUserId)
            .snapshots()
            .listen(
          (document) {
            _cacheLoginUser = _docToUserData(document);
            _loadedAuthenticatedUser.add(_cacheLoginUser);
          },
        );
      } catch (e) {
        throw RefreshAuthenticatedUserFailure();
      }
    }
  }

  Stream<UserData> loginUserData() => _loadedAuthenticatedUser.stream;

  Future<UserData> getUser({required String id}) async {
    if (id.isNotEmpty) {
      try {
        final document =
            await firebaseFirestore.collection('users').doc(id).get();

        return _docToUserData(document);
      } catch (_) {
        throw GetUserFailure();
      }
    }
    return UserData.empty;
  }

  UserData _docToUserData(DocumentSnapshot<Map<String, dynamic>> document) {
    final json = document.data();

    try {
      return UserData.fromJson(json ?? <String, dynamic>{});
    } catch (_) {
      throw UserDataDeserializationFailure();
    }
  }

  UserData get currentUserData {
    return _cacheLoginUser;
  }

  Future<UserData> reLoginUser({required String id}) async {
    final user = await getUser(id: id);
    _cacheLoginUser = user;
    loginUserId = id;

    return user;
  }

  void logout() {
    _cacheLoginUser = UserData.empty;
  }
}
