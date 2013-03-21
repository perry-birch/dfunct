// http://www.haskell.org/ghc/docs/latest/html/libraries/base/Data-Maybe.html#t:Maybe
library maybe;

import 'typedefs.dart';
import 'monad.dart';

class Maybe<T> implements Monad {
  final T _value;
  const Maybe._internal(this._value);

  /*
   * The bind method takes a returnM (a -> m b) map and calls bindMaybe with this instance
   */
  Maybe bind(returnMTR<Maybe, dynamic, dynamic> returnM) {
    return Maybe.bindMaybe(this, returnM);
  }

  /*
   * The >> operator takes a returnM (a -> m b) map and calls bindMaybe with this instance
   */
  Monad operator >>(returnMTR returnM) {
    return bind(returnM);
  }

  /*
   * Constructs a new Maybe based on the value given.
   * Will eval as nothing if null is passed.
   */
  static final returnM<Maybe> from = (value) {
    return new Maybe._internal(value);
  };

  /*
   * Constructs a new Maybe with state Nothing.
   */
  static final createM<Maybe> nothing = () {
    return from(null);
  };

  /*
   * Constructs a new Maybe with state Just(value).
   * Implies an assertion that the value will not be null.
   * Throws exception if value is null.
   */
  static final returnM<Maybe> just = (value) {
    if(value == null) { throw new StateError('Cannot construct ''Maybe.just'' from a null value'); }
    return from(value);
  };

  /*
   * The isJust function returns True if it's argument is Just.
   */
  static final predicateM<Maybe> isJust = (Maybe target) {
    return !isNothing(target);
  };

  /*
   * The isNothing function returns True if it's argument is Nothing.
   */
  static final predicateM<Maybe> isNothing = (Maybe target) {
    return target._value == null;
  };

  /*
   * The fromJust function extracts the element out of a Maybe and throws an error
   * if it's a Nothing.
   * ** Note: Strongly advised to use fromMaybe as throwing is typically bad.
   */
  static final extractorM<Maybe, dynamic> fromJust = (Maybe<dynamic> target) {
    if(isNothing(target)) { throw new StateError('Cannot extract value from Nothing using fromJust'); }
    return target._value;
  };

  /*
   * The fromMaybe function takes a default value and a Maybe value.  If the Maybe is
   * Nothing, it returns teh default value; otherwise, it returns the value contained
   * in the Maybe's Just.
   */
  static final extractorDefM<Maybe, dynamic> fromMaybe = (dynamic def, Maybe<dynamic> target) {
    if(isNothing(target)) { return def; }
    return target._value;
  };

  /*
   * The maybe function takes a default value, a function, and a Maybe value (this).
   * If the Maybe value is Nothing, the function returns the default value.  Otherwise,
   * it applies the function to the value inside the Just and returns the result.
   */
  static final extractorMapDefM<Maybe, dynamic, dynamic> maybe = (dynamic def, map<dynamic, dynamic> map, Maybe<dynamic> target) {
    if(isNothing(target)) { return def; }
    return map(target._value);
  };

  /*
   * The listToMaybe function returns Nothing on an empty list or Just a where a is
   * the first element of the list.
   */
  static final returnM<Maybe> listToMaybe = (List list) {
    if(list == null || list.length == 0) { return nothing(); }
    return just(list[0]);
  };

  /*
   * The maybeToList function returns an empty list when given Nothing or a singleton list
   * when not given Nothing.
   */
  static final extractorM<Maybe, List> maybeToList = (Maybe target) {
    if(isNothing(target)) { return new List(); }
    return [target._value];
  };

  /*
   * The catMaybes function takes a list of Maybes and returns a list of all the Just values.
   */
  static final iterableExtractorM<Maybe, dynamic> catMaybes = (Iterable<Maybe> source) {
    return source.where(isJust).map(fromJust);
  };

  /*
   * The mapMaybe function is a version of map which can throw out elements.  In particular
   * the functional argument returns something of type Maybe b.  If this is Nothing, no
   * element is added on to the result list.  If it is Just b then b is included.
   */
  static final liftExtractorM<Maybe, dynamic, dynamic> mapMaybe = (returnMTR<Maybe, dynamic, dynamic> returnM, Iterable<dynamic> source) {
    return source.map(returnM).where(isJust).map(fromJust);
  };

  /*
   * The bindMaybe function extracts the current value and applies a transform map using
   * the provided returnM
   */
  static final binderM<Maybe, dynamic, Maybe, dynamic> bindMaybe = (Maybe target, returnMTR<Maybe, dynamic, dynamic> returnM) {
    if(isNothing(target)) { return nothing(); }
    return returnM(target._value);
  };
}