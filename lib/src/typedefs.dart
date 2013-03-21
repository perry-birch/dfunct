library typedefs;

import 'monad.dart';

typedef R func<R>();
typedef R map<T,R>(T value);
typedef bool predicate<T>(T value);


//typedef T M<T>();

//typedef M<U> Lift<T, U>(M<T> from);

//typedef R IO<R>();
//typedef M<R> apply<T,R>(M<T> monad, map<T,R> map);
//typedef M<R> fmap<T,R>(map<T,R> map, M<T> monad);


// TODO: Extract typedefs to a seperate file
/*
 * createM :: Monad m => () -> m dynamic
 * Creates a dynamic Monad from unit, aka factory
 */
typedef M createM<M extends Monad>();
/*
 * createMT :: Monad m => () -> m T
 * Creates a typed Monad from unit, aka factory
 */
typedef MT createMT<MT extends Monad<T>, T>();
/*
 * returnM :: Monad m => dynamic -> m dynamic
 * Creates a dynamic Monad from dynamic value
 */
typedef M returnM<M extends Monad>(value);
/*
 * returnMT :: Monad m => T -> m T
 * Creates a typed Monad from a typed value
 */
typedef MT returnMT<MT extends Monad<T>, T>(T value);
/*
 * returnMTR :: Monad m => T -> m R
 */
typedef MR returnMTR<MR extends Monad<R>, T, R>(T value);
/*
 * predicateM :: Monad m => m dynamic -> bool
 * Evaluates a predicate against a dynamic Monad
 */
typedef bool predicateM<M extends Monad>(M target);
/*
 * predicateMT :: Monad m => m T -> bool
 * Evaluates a predicate against a typed Monad
 */
typedef bool predicateMT<M extends Monad<T>, T>(M target);
/*
 * mapM :: Monad m => m dynamic -> m dynamic
 * Maps value from target Monad into result Monad
 */
typedef M mapM<M extends Monad>(M target);
// I want to do this (but can't) because it more accurately describes the map types and
// guarantees like Monads on input and return:
// typedef M<R> mapM<M extends Monad, T, R>(M<T> target);
/*
 * mapMTR_M :: Monad m, m mT, m mR => mT dynamic -> mR dynamic
 * Maps value from target Monad into result Monad
 * ** Offers little (if any...) advantage beyond mapM
 */
typedef MR mapMTR_M<M extends Monad, MT extends M, MR extends M>(MT target);
/*
 * mapMTR_TR :: Monad mT, Monad mR => mT T -> mR R
 * Maps value from target Monad into result Monad
 * ** Doesn't guarantee use of matching Monad (i.e. Maybe -> Identity)
 */
typedef MR mapMTR_TR<MT extends Monad<T>, T, MR extends Monad<R>, R>(MT target);
/*
 * liftM :: Monad m => (T -> R) -> (m T -> m R)
 * Allows non Monadic map to act inside the Monad
 */
typedef mapM<M> liftM<M extends Monad, T, R>(map<T, R> liftee);
// TODO: Extend this for the more specific mapMTR... variants?

typedef R extractorM<M extends Monad<R>, R>(M target);
typedef R extractorMapM<M extends Monad<T>, T, R>(map<T, R> map, M target);

typedef R extractorDefM<M extends Monad<R>, R>(R def, M target);
typedef R extractorMapDefM<M extends Monad<T>, T, R>(R def, map<T, R> map, M target);

typedef Iterable<R> iterableExtractorM<M extends Monad<R>, R>(Iterable<M> source);

typedef R liftExtractorM<M extends Monad<R>, T, R>(returnMTR<M, T, R> returnM, Iterable<T> source);

//typedef M bindM<M extends Monad<T>, T, MR extends Monad<R>, R>(M target, mapM<T, MR> map);
typedef MR binderM<MT extends Monad<T>, T, MR extends Monad<R>, R>(MT target, returnMTR<MR, T, R> returnM);