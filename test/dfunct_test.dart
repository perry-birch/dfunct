library dfunct_test;

import 'package:unittest/unittest.dart';
import 'package:dfunct/dfunct.dart';

part 'src/monads/monad_test.dart';
part 'src/monads/maybe_test.dart';

part 'src/utils/charf_test.dart';
part 'src/utils/stringf_test.dart';

void main() {
  monad_tests();
  maybe_tests();

  charf_tests();
  stringf_tests();
}