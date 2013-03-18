library functional_test;

import 'package:unittest/unittest.dart';
import '../functional.dart';

part 'src/monad_test.dart';
part 'src/maybe_test.dart';

void main() {
  test('it', () {
    expect(1, 1);
    var a = new Maybe(10);
  });

  monad_tests();
  maybe_tests();
}