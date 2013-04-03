// http://www.haskell.org/ghc/docs/latest/html/libraries/base/Data-Maybe.html#t:Maybe
library maybe;

import '../typedefs/common.dart';
import 'monad.dart';

class Maybe<T> implements Monad<T> {
  final T _value;
  const Maybe._internal(this._value);

  /*
   * The bind method takes a CreaterMa1 (a -> m b) map and calls bindMaybe with this instance.
   */
  Maybe bind(Creator1<Maybe, dynamic> creator) {
    return Maybe.bindMaybe(this)(creator);
  }

  /*
   * The lift method takes a Func1 (a -> b) and calls liftMaybe with this instance.
   */
  Maybe map(Func1<T, dynamic> mapper) {
    return Maybe.mapMaybe(this)(mapper);
  }

  /*
   * The >> operator takes a Creator1 (a -> m b) map and calls bind on this instance.
   */
  Maybe operator >>(Creator1<Maybe, dynamic> creator) {
    return bind(creator);
  }

  /*
   * The << operator attempts to extract the value from Maybe using the same rules as fromMaybe
   */
  Maybe operator <<(dynamic def) {
    return fromMaybe(def)(this);
  }

  /*
   * The | operator takes a Func1 (a -> b) and calls lift on this instance.
   */
  Maybe operator |(Func1<T, dynamic> mapper) {
    return map(mapper);
  }

  /*
   * Constructs a new Maybe based on the value given.
   * Will eval as nothing if null is passed.
   */
  static final Creator1<Maybe, dynamic> from = (dynamic value) {
    return new Maybe._internal(value);
  };

  /*
   * Constructs a new Maybe with state Nothing.
   */
  static final Creator<Maybe> nothing = () {
    return from(null);
  };

  /*
   * Constructs a new Maybe with state Just(value).
   * Implies an assertion that the value will not be null.
   * Throws exception if value is null.
   */
  static final Creator1<Maybe, dynamic> just = (dynamic value) {
    if(value == null) { throw new StateError('Cannot construct ''Maybe.just'' from a null value'); }
    return from(value);
  };

  /*
   * The isJust function returns True if it's argument is Just.
   */
  static final Predicate<Maybe> isJust = (Maybe target) {
    return !isNothing(target);
  };

  /*
   * The isNothing function returns True if it's argument is Nothing.
   */
  static final Predicate<Maybe> isNothing = (Maybe target) {
    return target._value == null;
  };

  /*
   * The fromJust function extracts the element out of a Maybe and throws an error
   * if it's a Nothing.
   * ** Note: Strongly advised to use fromMaybe as throwing is typically bad.
   */
  static final Extractor<Maybe, dynamic> fromJust = (Maybe target) {
    if(isNothing(target)) { throw new StateError('Cannot extract value from Nothing using fromJust'); }
    return target._value;
  };

  /*
   * The fromMaybe function takes a default value and a Maybe value.  If the Maybe is
   * Nothing, it returns teh default value; otherwise, it returns the value contained
   * in the Maybe's Just.
   */
  static final DefExtractor<Maybe, dynamic> fromMaybe = (dynamic def) {
    return (Maybe target) {
      if(isNothing(target)) { return def; }
      return target._value;
    };
  };

  /*
   * The maybe function takes a default value, a function, and a Maybe value (this).
   * If the Maybe value is Nothing, the function returns the default value.  Otherwise,
   * it applies the function to the value inside the Just and returns the result.
   */
  static final DefLifterExtractor maybe = (dynamic def) {
    return (Func1<dynamic, dynamic> map) {
      return (Maybe target) {
        if(isNothing(target)) { return def; }
        return map(target._value);
      };
    };
  };

  /*
   * The listToMaybe function returns Nothing on an empty list or Just a where a is
   * the first element of the list.
   */
  static final Creator1<Maybe, Iterable> listToMaybe = (Iterable source) {
    if(source == null || source.length == 0) { return nothing(); }
    return just(source.elementAt(0));
  };

  /*
   * The maybeToList function returns an empty list when given Nothing or a singleton list
   * when not given Nothing.
   */
  static final Extractor<Maybe, List> maybeToList = (Maybe target) {
    if(isNothing(target)) { return new List(); }
    return [target._value];
  };

  /*
   * The catMaybes function takes a list of Maybes and returns a list of all the Just values.
   */
  static final MapperExtractorT<Maybe, dynamic> catMaybes = (Iterable<Maybe> source) {
    return source.where(isJust).map(fromJust);
  };

  /*
   * The mapMaybe function creates a lazy eval Maybe which will apply the provided map to the
   * value whenever it is realized.
   */
  // TODO: this signature should flip target and mapper positions to be consistent?
  static final TargeterMapper<Maybe, dynamic, dynamic> mapMaybe = (Maybe target) {
    return (Func1<dynamic, dynamic> mapper) {
      if(isNothing(target)) { return nothing(); }
      return new Maybe._internal(mapper(target._value));
    };
  };

  /*
   * The mapReduceMaybe function is a version of map which can throw out elements.  In particular
   * the functional argument returns something of type Maybe b.  If this is Nothing, no
   * element is added on to the result list.  If it is Just b then b is included.
   */
  static final Creator1MapperExtractorT<Maybe, dynamic, dynamic> mapReduceMaybe = (Creator1<Maybe, dynamic> creator) {
    return (Iterable<dynamic> source) {
      return source.map(creator) // Map into the monad
          .where(isJust) // Reduce the Nothings
          .map(fromJust); // Extract the results
    };
  };

  /*
   * The bindMaybe function extracts the current value and applies a transform map using
   * the provided returnM.
   */
  static final TargeterBinder<Maybe, dynamic, dynamic> bindMaybe = (Maybe target) {
    return (Creator1<Maybe, dynamic> creator) {
      if(isNothing(target)) { return nothing(); }
      return creator(target._value);
    };
  };


  // This doesn't belong in Maybe<T> but instead in a List<Maybe<T>>...?
  /*
   * The mapLiftMaybe function creates a lazy eval Maybe collecion which will apply the provided
   * map to the value whenver any are realized.
   */
  //static final MapperLifter<Maybe, dynamic, dynamic> mapLiftMaybe = (Iterable<Maybe> source) {
  /*static final LifterMapper liftMaybes = (Func1 liftee) {
    return (Iterable<Maybe> source) {
      return source.map((target) {
        if(isNothing(target)) { return nothing(); }
        return new Maybe._internal(liftee(target._value));
      });
    };
  };*/
}