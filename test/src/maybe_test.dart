part of dfunct_test;

maybe_tests() {
  group('-maybe- should', () {

    test('call bindMaybe with current instance when bind is called', () {
      // Arrange
      var value = 10;
      var returnM = (item) => Maybe.just('item: ${item * 2}');
      var maybe = Maybe.just(value);

      // Act
      var maybe2 = maybe.bind(returnM);

      // Assert
      expect(Maybe.fromJust(maybe2), 'item: 20');
    });

    test('call liftMaybe with current instance when lift is called', () {
      // Arrange
      var value = 10;
      var map = (item) => 'item: ${item * 4}';
      var maybe = Maybe.just(value);

      // Act
      var maybe2 = maybe.lift(map);
      var actual = Maybe.fromJust(maybe2);

      // Assert
      expect(actual, 'item: 40');
    });

    test('associate bind to >> operator', () {
      // Arrange
      var value = 10;
      var maybe = Maybe.just(value);
      var map = (item) => Maybe.just(item * 3);

      // Act
      var maybe2 = maybe >> map;

      // Assert
      expect(Maybe.fromJust(maybe2), 30);
    });

    test('associate lift to | operator', () {
      // Arrange
      var value = 10;
      var map = (item) => 'item: ${item * 4}';
      var maybe = Maybe.just(value);

      // Act
      var maybe2 = maybe | map;

      // Assert
      expect(Maybe.fromJust(maybe2), 'item: 40');
    });

    test('return true for isJust when there is a value', () {
      // Arrange
      var value = 10;
      var maybe = Maybe.from(value);

      // Act
      var isJust = Maybe.isJust(maybe);

      // Assert
      expect(isJust, true);
    });

    test('return false for isJust when there it is Nothing', () {
      // Arrange
      var value = null;
      var maybe = Maybe.from(value);

      // Act
      var isJust = Maybe.isJust(maybe);

      // Assert
      expect(isJust, false);
    });

    test('return false for isNothing when there is a value', () {
      // Arrange
      var value = 10;
      var maybe = Maybe.from(value);

      // Act
      var isNothing = Maybe.isNothing(maybe);

      // Assert
      expect(isNothing, false);
    });

    test('return true for isNothing when there it is Nothing', () {
      // Arrange
      var value = null;
      var maybe = Maybe.from(value);

      // Act
      var isNothing = Maybe.isNothing(maybe);

      // Assert
      expect(isNothing, true);
    });

    test('return a Nothing from Maybe.nothing()', () {
      // Arrange

      // Act
      var maybe = Maybe.nothing();

      // Assert
      expect(Maybe.isNothing(maybe), true);
    });

    test('be nothing for null', () {
      // Arrange
      var value = null;

      // Act
      var maybe = Maybe.from(value);

      // Assert
      expect(Maybe.isNothing(maybe), true);
    });

    test('be something for int', () {
      // Arrange
      var value = 10;

      // Act
      var maybe = Maybe.from(10);

      // Assert
      expect(Maybe.isJust(maybe), true);
    });

    test('return a Just from Maybe.just(value)', () {
      // Arrange
      var value = 10;

      // Act
      var maybe = Maybe.just(value);

      // Assert
      expect(Maybe.isJust(maybe), true);
    });

    test('throw StateError exception for passing null to Myabe.just(value)', () {
      // Arrange
      var value = null;
      var caught = false;

      try {
        // Act
        Maybe.just(value);
      } catch (ex) {
        // Assert
        expect(ex is StateError, true);
        caught = true;
      }
      expect(caught, true);
    });

    test('throw StateError exception for fromJust on a Nothing', () {
      // Arrange
      var nothing = Maybe.nothing();
      var caught = false;

      try {
        // Act
        Maybe.fromJust(nothing);
      } catch (ex) {
        // Assert
        expect(ex is StateError, true);
        caught = true;
      }
      expect(caught, true);
      //expect(Maybe.fromJust(nothing), throwsA(new isInstanceOf<StateError>())));
      //expect(Maybe.fromJust(nothing), throwsStateError);
    });

    test('return default value for fromMaybe if Maybe is Nothing', () {
      // Arrange
      var maybe = Maybe.nothing();
      var defaultValue = 5;
      var fromOrDef = Maybe.fromMaybe(defaultValue);

      // Act
      var actual = fromOrDef(maybe);

      // Assert
      expect(actual, defaultValue);
    });

    test('return Just value for fromMaybe if Maybe is Just', () {
      // Arrange
      var value = 10;
      var maybe = Maybe.just(value);
      var defaultValue = 5;

      // Act
      var actual = Maybe.fromMaybe(defaultValue)(maybe);

      // Assert
      expect(actual, value);
    });

    test('return default value from maybe if target is Nothing', () {
      // Arrange
      var maybe = Maybe.nothing();
      var map = (item) => item;

      // Act
      var actual = Maybe.maybe(5)(map)(maybe);

      // Assert
      expect(actual, 5);
    });

    test('return value from maybe if target is Just', () {
      // Arrange
      var value = 10;
      var maybe = Maybe.just(value);
      var map = (item) => item;

      // Act
      var actual = Maybe.maybe(5)(map)(maybe);

      // Assert
      expect(actual, 10);
    });

    test('return Nothing for listToMaybe with null', () {
      // Arrange
      var value = null;

      // Act
      var actual = Maybe.listToMaybe(value);

      // Assert
      expect(Maybe.isNothing(actual), true);
    });

    test('return Nothing for listToMaybe with an empty list', () {
      // Arrange
      var value = [];

      // Act
      var actual = Maybe.listToMaybe(value);

      // Assert
      expect(Maybe.isNothing(actual), true);
    });

    test('return Just for listToMaybe with a non-empty list', () {
      // Arrange
      var value = [1, 2, 3];

      // Act
      var actual = Maybe.listToMaybe(value);

      // Assert
      expect(Maybe.isJust(actual), true);
    });

    test('return Just with first element value for listToMaybe with a non-empty list', () {
      // Arrange
      var value = [1, 2, 3];

      // Act
      var actual = Maybe.listToMaybe(value);

      // Assert
      expect(Maybe.fromJust(actual), 1);
    });

    test('return an empty list for maybeToList with Nothing', () {
      // Arrange
      var maybe = Maybe.nothing();

      // Act
      var actual = Maybe.maybeToList(maybe);

      // Assert
      expect(actual.length, 0);
    });

    test('return a singleton list with value from Just for maybeToList with Just', () {
      // Arrange
      var value = 10;
      var maybe = Maybe.just(value);

      // Act
      var actual = Maybe.maybeToList(maybe);

      // Assert
      expect(actual.length, 1);
      expect(actual[0], value);
    });

    test('return an empty list for catMaybes with all Nothing source', () {
      // Arrange
      var maybes = [Maybe.nothing(), Maybe.nothing(), Maybe.nothing()];

      // Act
      var actual = Maybe.catMaybes(maybes);

      // Assert
      expect(actual.length, 0);
    });

    test('return a list with Nothings removed for catMaybes with a mixed source', () {
      // Arrange
      var maybes = [Maybe.just(5), Maybe.nothing(), Maybe.just(6), Maybe.nothing(), Maybe.just(7)];

      // Act
      var actual = Maybe.catMaybes(maybes);

      // Assert
      expect(actual.length, 3);
      expect(actual.elementAt(0), 5);
      expect(actual.elementAt(1), 6);
      expect(actual.elementAt(2), 7);
    });

    test('return an empty list for mapMaybe with all Nothing source result', () {
      // Arrange
      var source = [1, 2, 3];
      var returnM = (a) {
        if(a < 10) { return Maybe.nothing(); }
        else { return Maybe.just(a); }
      };

      // Act
      var actual = Maybe.mapMaybe(returnM)(source);

      // Assert
      expect(actual.length, 0);
    });

    test('return a list with Nothings removed for mapMaybe with a mixed source', () {
      // Arrange
      var source = [1, 2, 3, 11, 12, 13];
      var returnM = (a) {
        if(a < 10) { return Maybe.nothing(); }
        else { return Maybe.just('value: ${a}'); }
      };

      // Act
      var actual = Maybe.mapMaybe(returnM)(source);

      // Assert
      expect(actual.length, 3);
      expect(actual.elementAt(0), 'value: 11');
      expect(actual.elementAt(1), 'value: 12');
      expect(actual.elementAt(2), 'value: 13');
    });

    test('be ablt to bindMaybe function to just', () {
      // Arrange
      var value = 10;
      var returnM = (item) => Maybe.just('item: ${item * 2}');
      var maybe = Maybe.just(value);

      // Act
      var maybe2 = Maybe.bindMaybe(maybe)(returnM);

      // Assert
      expect(Maybe.fromJust(maybe2), 'item: 20');
    });

    test('still be Nothing after bindMaybe to Nothing', () {
      // Arrange
      var value = null;
      var returnM = (item) => Maybe.just('item: ${item * 2}');
      var maybe = Maybe.from(value);

      // Act
      var maybe2 = Maybe.bindMaybe(maybe)(returnM);

      // Assert
      expect(Maybe.isNothing(maybe2), true);
    });

    test('be nothing if bindMaybe operation produces null', () {
      // Arrange
      var value = 10;
      var returnM = (item) => Maybe.from(null);
      var maybe = Maybe.just(value);

      // Act
      var maybe2 = Maybe.bindMaybe(maybe)(returnM);

      // Assert
      expect(Maybe.isNothing(maybe2), true);
    });

    test('return mapped value from liftMaybe', () {
      // Arrange
      var value = 10;
      var map = (item) => 'item: ${item * 4}';
      var maybe = Maybe.just(value);

      // Act
      var maybe2 = Maybe.liftMaybe(maybe)(map);

      // Assert
      expect(Maybe.fromJust(maybe2), 'item: 40');
    });

    test('still be Nothing after liftMaybe to Nothing', () {
      // Arrange
      var value = null;
      var map = (item) => 'item: ${item * 2}';
      var maybe = Maybe.from(value);

      // Act
      var maybe2 = Maybe.liftMaybe(maybe)(map);

      // Assert
      expect(Maybe.isNothing(maybe2), true);
    });

    test('be nothing if liftMaybe operation produces null', () {
      // Arrange
      var value = 10;
      var map = (item) => null;
      var maybe = Maybe.just(value);

      // Act
      var maybe2 = Maybe.liftMaybe(maybe)(map);

      // Assert
      expect(Maybe.isNothing(maybe2), true);
    });

    test('trigger map once applied', () {
      // Arrange
      var value = 10;
      var evaluated = false;
      var map = (item) {
        evaluated = true;
        return 'item: $item';
      };
      var maybe = Maybe.just(value);

      // Act
      var maybe2 = Maybe.liftMaybe(maybe)(map);

      // Assert
      expect(evaluated, true);
    });

    test('trigger map only once, when value is realized', () {
      // Arrange
      var value = 10;
      var evaluated = 0;
      var map = (item) {
        evaluated++;
        return 'item: $item';
      };
      var maybe = Maybe.just(value);
      var maybe2 = Maybe.liftMaybe(maybe)(map);

      // Act
      var result = Maybe.fromJust(maybe2);

      // Assert
      expect(evaluated, 1);
    });

    test('use a map and lift together across a list of Maybe', () {
      // Arrange
      Iterable<Maybe> maybes = [ Maybe.from(10), Maybe.from(20), Maybe.from(30) ];
      var times2 = (_) => _ * 2;

      // Act
      var result = maybes.map((item) => item | times2);

      // Assert
      expect(result.length, 3);
      expect(Maybe.fromJust(result.elementAt(0)), 20);
      expect(Maybe.fromJust(result.elementAt(1)), 40);
    });

    test('map across the Monad collection and lift the provided function', () {
      // Arrange
      Iterable<Maybe> maybes = [ Maybe.from(10), Maybe.from(20), Maybe.from(30) ];
      Func1<dynamic, dynamic> times2 = (_) => _ * 2;

      // Act
      var result = Maybe.liftMaybes(times2)(maybes);
      //var result = Maybe.mapLiftMaybe(maybes)(times2);

      // Assert
      expect(result.length, 3);
      expect(Maybe.fromJust(result.elementAt(0)), 20);
      expect(Maybe.fromJust(result.elementAt(1)), 40);
    });

    /*test('map the provided values through the Maybe monad and cat the final results', () {
      // Arrange
      var values = [ 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 ];
      var toMaybe = (_) => Maybe.from(_);
      var modThree = (_) => _ % 3;
      var isEven = (_) => _ % 2 == 0;
      var where = (predicate) => (_) => predicate(_) ? _ : null;
      var lift = (f) => (maybe) => maybe | f;

      // Act
      var result = Maybe.catMaybes(values.map(toMaybe).map(lift(modThree)).map(lift(where(isEven))));

      // Assert
      expect(result.length, 6);
      expect(result.elementAt(0), 2);
      expect(result.elementAt(1), 0);
      expect(result.elementAt(2), 2);
      expect(result.elementAt(3), 0);
    });*/

  }); // End Test Group
}



