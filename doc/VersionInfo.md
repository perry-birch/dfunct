* 0.0.7 *
- Added << operator to Maybe monad to support value extraction

* 0.0.6 *
- Major refactoring to Maybe monad, trying to embrace currying and type-safety (in checked at least)
- Added a ton of structure to common typedefs, starting to use them in other libraries myself which is encouraging
- Added Functor class under Monad (which should have been this way in Haskell aparantly so we can do it right from the outset!)
- Broke the Dart VM (but it's fixed now): http://stackoverflow.com/questions/15614472/unit-test-hanging-when-using-lexical-scoping-and-generics-with-extends

* 0.0.5 *
- Refactored Maybe monad (added currying to most (all?) multi param calls)
- Cleaned up and organized typedefs
- Extended typedefs into _common file

* 0.0.4 *
- Refactored Maybe monad (move instance methods and minor changes)
- Updated pubspec to 'hopefully' fix dependency brittleness

* 0.0.3 *
- Refactored Maybe monad
- Was able to remove all references to 'new' while preserving (improving?) the implementation
- - In hindsight I'd already swtiched to the func style toward the end of the unit test but it took a night of sleep to connect the dots

* 0.0.2 *
- Bumped version to fix some typos and info on dart pub page
 
* 0.0.1 *
- Initial release with Maybe monad implemented but little else