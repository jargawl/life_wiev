// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:api_client/api_client.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:users_repository/src/models/models.dart';

class UsersRepository {
  UsersRepository({
    required AuthenticationRepository authenticationRepository,
    required ApiClient apiClient,
  })  : _authenticationRepository = authenticationRepository,
        _apiClient = apiClient {
    _userDataSubscription = _apiClient.loginUserData().listen(
      (userData) {
        _cacheUser = User.fromData(userData);
        _loadedAuthenticatedUser.add(_cacheUser);
      },
    );

    _userAuthenticationSubscription =
        _authenticationRepository.user.listen((userAuthentication) {});
  }
  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<UserAuthentication>
      _userAuthenticationSubscription;

  final ApiClient _apiClient;
  late final StreamSubscription<UserData> _userDataSubscription;

  final StreamController<User> _loadedAuthenticatedUser =
      StreamController<User>.broadcast();

  var _cacheUser = User.empty;

  User get currentLoginUser {
    return _cacheUser;
  }

  void dispose() {
    _loadedAuthenticatedUser.close();
    _userDataSubscription.cancel();
    _loadedAuthenticatedUser.close();
    _userAuthenticationSubscription.cancel();
  }

  void refreshAuthenticatedUser() {
    _apiClient.refreshAuthenticatedUser();

    _loadedAuthenticatedUser.add(_cacheUser);
  }

  Stream<User> loginUserStream() => _loadedAuthenticatedUser.stream;

  Future<void> addNewUser({
    required String? id,
    required String email,
    required String name,
    required String photo,
  }) async {
    if (id != null) {
      await _apiClient.addNewUser(
        id: id,
        email: email,
        name: name,
        photo: photo,
      );
    }
  }

  Future<void> updateUser({
    required User user,
  }) async {
    final userData = user.toData();
    await _apiClient.updateUser(user: userData);
  }

  Future<User> getUser({required String id}) async {
    final userData = await _apiClient.getUser(id: id);
    final user = User.fromData(userData);
    return user;
  }

  Future<User> reLoginUser({required String id}) async {
    await _apiClient.reLoginUser(id: id);
    _apiClient.refreshAuthenticatedUser();

    final userData = await _apiClient.getUser(id: id);
    final user = User.fromData(userData);
    _cacheUser = user;
    return user;
  }

  void logout() {
    _apiClient.logout();
    _cacheUser = User.empty;
  }

}
