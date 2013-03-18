// http://www.haskell.org/ghc/docs/latest/html/libraries/base/Data-Maybe.html#t:Maybe
library maybe;

import 'monad.dart';

abstract class Option<T> {}
class Just<T> implements Option<T> {
  final T value;
  const Just._internal(this.value);
}
class Nothing<T> implements Option<T> {
  const Nothing._internal();
}

class Maybe<T> implements Monad {
  final Option<T> state;
  const Maybe._internal(this.state);
  factory Maybe(T value) {
    if(value == null) {
      return new Maybe._internal(new Nothing._internal());
    } else {
      return new Maybe._internal(new Just._internal(value));
    }
  }

  /*
   * Constructs a new Maybe with state Nothing.
   */
  static final createM<Maybe> nothing = () {
    return new Maybe(null);
  };

  /*
   * Constructs a new Maybe with state Just(value).
   */
  static final returnM<Maybe> just = (value) {
    return new Maybe(value);
  };

  /*
   * The isJust function returns True if it's argument is Just.
   */
  static final predicateM<Maybe> isJust = (Maybe target) {
    return target.state is Just;
  };

  /*
   * The isNothing function returns True if it's argument is Nothing.
   */
  static final predicateM<Maybe> isNothing = (Maybe target) {
    return target.state is Nothing;
  };

  /*
   * The fromJust function extracts the element out of a Maybe and throws an error
   * if it's a Nothing.
   * ** Note: Strongly advised to use fromMaybe as throwing is typically bad.
   */
  static final extractorM<Maybe, dynamic> fromJust = (Maybe<dynamic> target) {
    if(isNothing(target)) { throw new StateError('Cannot extract value from Nothing using fromJust'); }
    Just state = target.state;
    return state.value;
  };

  /*
   * The fromMaybe function takes a default value and a Maybe value.  If the Maybe is
   * Nothing, it returns teh default value; otherwise, it returns the value contained
   * in the Maybe's Just.
   */
  static final extractorDefM<Maybe, dynamic> fromMaybe = (dynamic def, Maybe<dynamic> target) {
    if(isNothing(target)) { return def; }
    return fromJust(target);
  };

  /*
   * The maybe function takes a default value, a function, and a Maybe value (this).
   * If the Maybe value is Nothing, the function returns the default value.  Otherwise,
   * it applies the function to the value inside the Just and returns the result.
   */
  static final extractorMapDefM<Maybe, dynamic, dynamic> maybe = (dynamic def, map<dynamic, dynamic> map, Maybe<dynamic> target) {
    if(isNothing(target)) {
      return def;
    }
    return map(fromJust(target));
  };

  /*
   * The listToMaybe function returns Nothing on an empty list or Just a where a is
   * the first element of the list.
   */
  static final returnM<Maybe> listToMaybe = (List list) {
    if(list == null) { return nothing(); }
    if(list.length == 0) { return nothing(); }
    return just(list[0]);
  };

  /*
   * The maybeToList function returns an empty list when given Nothing or a singleton list
   * when not given Nothing.
   */
  static final extractorM<Maybe, List> maybeToList = (Maybe target) {
    if(isNothing(target)) { return new List(); }
    return [fromJust(target)];
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
    return returnM(fromJust(target));
  };

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
}