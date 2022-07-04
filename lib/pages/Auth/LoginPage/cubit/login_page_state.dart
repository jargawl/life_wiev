part of 'login_page_cubit.dart';


@immutable
class LoginPageState {
  final User? user;
  final bool isLoaading;
  final String errorMessage;
  

  const LoginPageState({
    required this.user,
    required this.isLoaading,
    required this.errorMessage,
  });
}
