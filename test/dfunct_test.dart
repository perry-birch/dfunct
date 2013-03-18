library dfunct_test;

import 'package:unittest/unittest.dart';
import '../lib/dfunct.dart';

part 'src/monad_test.dart';
part 'src/maybe_test.dart';

void main() {
  monad_tests();
  maybe_tests();
}