import 'package:flutter/material.dart';

/// class that describes the user sex.

enum Sex {
  /// user sex: man
  man,

  /// user sex: woman
  woman,

  /// user sex: not specify
  notSpecify,
}

/// class that includes additional Sex related methods.
extension SexExtension on Sex {
  /// returns the sex type as a [String]
  String get toJson {
    switch (this) {
      case Sex.man:
        return 'man';
      case Sex.woman:
        return 'woman';

      case Sex.notSpecify:
        return 'notSpecify';
    }
  }

  /// return Sex instance from String
  Sex fromString(String sex) {
    switch (sex) {
      case 'man':
        return Sex.man;
      case 'woman':
        return Sex.woman;
      case 'notSpecify':
        return Sex.notSpecify;
      default:
        return Sex.notSpecify;
    }
  }

  /// return the IconData icon related with specific sex
  IconData get groupIcon {
    switch (this) {
      case Sex.man:
        return Icons.man_outlined;

      case Sex.woman:
        return Icons.woman_outlined;

      case Sex.notSpecify:
        return Icons.wc_outlined;
    }
  }
}
