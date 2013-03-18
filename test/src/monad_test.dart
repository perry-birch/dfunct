part of functional_test;

monad_tests() {
  group('-monad- should', () {

    test('return ', () {

      var func1 = (int a1, [int a2, int a3, int a4]) {
        return a1 + a2 + a3 + a4;
      };

      var actual1 = func1(1, 2, 3, 4);

      expect(actual1, 10);

      //var func2 = func1(10);

      //expect(func2 == null, false);
      //var actual2 = func2(11);


      expect(1, 1);
    });

  });
}