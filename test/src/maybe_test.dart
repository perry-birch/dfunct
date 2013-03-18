part of functional_test;

maybe_tests() {
  group('-maybe- should', () {

    test('return true for isJust when there is a value', () {
      // Arrange
      var value = 10;
      var maybe = new Maybe(value);

      // Act
      var isJust = Maybe.isJust(maybe);

      // Assert
      expect(isJust, true);
    });

    test('return false for isJust when there it is Nothing', () {
      // Arrange
      var value = null;
      var maybe = new Maybe(value);

      // Act
      var isJust = Maybe.isJust(maybe);

      // Assert
      expect(isJust, false);
    });

    test('return false for isNothing when there is a value', () {
      // Arrange
      var value = 10;
      var maybe = new Maybe(value);

      // Act
      var isNothing = Maybe.isNothing(maybe);

      // Assert
      expect(isNothing, false);
    });

    test('return true for isNothing when there it is Nothing', () {
      // Arrange
      var value = null;
      var maybe = new Maybe(value);

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
      var maybe = new Maybe(value);

      // Assert
      expect(Maybe.isNothing(maybe), true);
    });

    test('be something for int', () {
      // Arrange
      var value = 10;

      // Act
      var maybe = new Maybe(10);

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

      // Act
      var actual = Maybe.fromMaybe(defaultValue, maybe);

      // Assert
      expect(actual, defaultValue);
    });

    test('return Just value for fromMaybe if Maybe is Just', () {
      // Arrange
      var value = 10;
      var maybe = Maybe.just(value);
      var defaultValue = 5;

      // Act
      var actual = Maybe.fromMaybe(defaultValue, maybe);

      // Assert
      expect(actual, value);
    });

    test('be able to bind function to value of Just', () {
      // Arrange
      var value = 10;
      var returnM = (item) => new Maybe('item: ${item * 2}');
      var maybe = new Maybe(value);

      // Act
      var maybe2 = maybe.bind(returnM);

      // Assert
      expect(Maybe.fromJust(maybe2), 'item: 20');
    });

    test('still be Nothing after bind to Nothing', () {
      // Arrange
      var value = null;
      var returnM = (item) => new Maybe('item: ${item * 2}');
      var maybe = new Maybe(value);

      // Act
      var maybe2 = maybe.bind(returnM);

      // Assert
      expect(Maybe.isNothing(maybe2), true);
    });

    test('be nothing if bind operation produces null', () {
      // Arrange
      var value = 10;
      var returnM = (item) => new Maybe(null);
      var maybe = new Maybe(value);

      // Act
      var maybe2 = maybe.bind(returnM);

      // Assert
      expect(Maybe.isNothing(maybe2), true);
    });

    test('associate bind to >> operator', () {
      // Arrange
      var value = 10;
      var maybe = new Maybe(value);
      var map = (item) => new Maybe(item * 3);

      // Act
      var maybe2 = maybe >> map;

      // Assert
      expect(Maybe.fromJust(maybe2), 30);
    });

    test('return default value from maybe if target is Nothing', () {
      // Arrange
      var value = null;
      var maybe = new Maybe(value);
      var map = (item) => item;

      // Act
      var actual = Maybe.maybe(5, map, maybe);

      // Assert
      expect(actual, 5);
    });

    test('return value from maybe if target is Just', () {
      // Arrange
      var value = 10;
      var maybe = new Maybe(value);
      var map = (item) => item;

      // Act
      var actual = Maybe.maybe(5, map, maybe);

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
      var actual = Maybe.mapMaybe(returnM, source);

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
      var actual = Maybe.mapMaybe(returnM, source);

      // Assert
      expect(actual.length, 3);
      expect(actual.elementAt(0), 'value: 11');
      expect(actual.elementAt(1), 'value: 12');
      expect(actual.elementAt(2), 'value: 13');
    });

  }); // End Test Group
}



