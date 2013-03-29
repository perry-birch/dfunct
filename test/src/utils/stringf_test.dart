part of dfunct_test;

stringf_tests() {
  group('-stringf- should', () {

    test('return lowered string', () {
      // Arrange
      var upperString = "ALL UPPER VALUES";

      // Act
      var lowerString = Stringf.toLower(upperString);

      // Assert
      expect(lowerString, "all upper values");
    });

  });
}

