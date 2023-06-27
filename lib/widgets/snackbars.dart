import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class MySnackBars {
  /// failure
  static var failureSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Ohh no!',
      message: 'Incorrect login or password !',
      contentType: ContentType.failure,
    ),
  );

  /// help
  static var helpSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Hi There!',
      message:
          'You need to use this package in the app to uplift your Snackbar Experinece!',
      contentType: ContentType.help,
    ),
  );

  /// success
  static var successSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'How to use it ?',
      message:
          'Control and analysis of emotions. Reset by holding down an emoticon.',
      contentType: ContentType.success,
    ),
  );
    /// success
  static var successAddSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'How to use it ?',
      message:
          'Control and analysis of emotions. Reset by holding down an emoticon.',
      contentType: ContentType.success,
    ),
  );

  /// warning
  static var warningSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Warning!',
      message: 'Something went wrong...',
      contentType: ContentType.warning,
    ),
  );

    /// password changes
  static var passwordChange = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Check your email!',
      message: 'Password reset email sent',
      contentType: ContentType.warning,
    ),
  );
}
