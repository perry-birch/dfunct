library charf;

import '../typedefs/common.dart';

class Charf {
  static const UPPER_A = 0x41; // A
  static const UPPER_Z = 0x5A; // Z
  static const LOWER_A = 0x61; // a
  static const LOWER_Z = 0x7A; // z
  static const LOWER_UPPER_DELTA = LOWER_A - UPPER_A; // a - A

  static const int HT = 9;
  static const int LF = 10;
  static const int CR = 13;
  static const int SP = 32;
  static const int COMMA = 44;
  static const int DASH = 45;
  static const int SLASH = 47;
  static const int ZERO = 48;
  static const int ONE = 49;
  static const int COLON = 58;
  static const int SEMI_COLON = 59;

  static final Predicate<int> isLower = (int byte) {
    return LOWER_A <= byte && byte <= LOWER_Z;
  };

  static final Predicate<int> isUpper = (int byte) {
    return UPPER_A <= byte && byte <= UPPER_Z;
  };

  static final Converter<int, int> toLower = (int byte) {
    return isUpper(byte) ? byte + LOWER_UPPER_DELTA : byte;
  };

  static final Converter<int, int> toUpper = (int byte) {
    return isLower(byte) ? byte - LOWER_UPPER_DELTA : byte;
  };
}

