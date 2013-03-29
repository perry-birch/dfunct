part of dfunct_test;

charf_tests() {
  group('-charf- should', () {

    test('return true for valid isLower', () {
      // Arrange
      var values = "aetz";

      for(int i = 0; i < values.length; i++) {
        // Act
        var result = Charf.isLower(values.codeUnits[i]);

        // Assert
        expect(result, true);
      }
    });

    test('return false for invalid isLower', () {
      // Arrange
      var values = 'AETZ';

      for(int i = 0; i < values.length; i++) {
        // Act
        var result = Charf.isLower(values.codeUnits[i]);

        // Assert
        expect(result, false);
      }
    });

    test('return true for valid isUpper', () {
      // Arrange
      var values = "AETZ";

      for(int i = 0; i < values.length; i++) {
        // Act
        var result = Charf.isUpper(values.codeUnits[i]);

        // Assert
        expect(result, true);
      }
    });

    test('return false for invalid isUpper', () {
      // Arrange
      var values = 'aetz';

      for(int i = 0; i < values.length; i++) {
        // Act
        var result = Charf.isUpper(values.codeUnits[i]);

        // Assert
        expect(result, false);
      }
    });

    test('return upper char for each provided lower char', () {
      // Arrange
      var values = 'aetz';
      var expected = 'AETZ';

      for(int i = 0; i < values.length; i++) {
        // Act
        var result = Charf.toUpper(values.codeUnits[i]);

        // Assert
        expect(result, expected.codeUnits[i]);
      }
    });

    test('return lower char for each provided upper char', () {
      // Arrange
      var values = 'AETZ';
      var expected = 'aetz';

      for(int i = 0; i < values.length; i++) {
        // Act
        var result = Charf.toLower(values.codeUnits[i]);

        // Assert
        expect(result, expected.codeUnits[i]);
      }
    });
  });
}

