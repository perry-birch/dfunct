library typedefs;

import '../monads_lib.dart';

/*
 * CreaterM :: Monad m => () -> m dynamic
 * Creates a dynamic Monad from unit, aka factory
 */
//typedef M CreatorM<M extends Monad>();
/*
 * CreatorM(n) :: Monad m => dynamic -> m dynamic
 * Creates a dynamic Monad from value(s)
 */
//typedef M CreatorM1<M extends Monad, T1>(T1 arg1);
//typedef M CreatorM2<M extends Monad, T1, T2>(T1 arg1, T2 arg2);
//typedef M CreatorM3<M extends Monad, T1, T2, T3>(T1 arg1, T2 arg2, T3 arg3);
/*
 * CreatorMa :: Monad m => () -> m T
 * Creates a typed Monad from unit, aka factory
 */
//typedef M CreatorMa<M extends Monad<Ma>, Ma>();
//typedef M WrapperMa<M extends Monad<Ma>, Ma>(Ma value);
/*
 * CreatorMa(n) :: Monad m => T -> m T
 * Creates a typed Monad from value(s)
 */
//typedef M CreatorMa1<M extends Monad<Ma>, Ma, T1>(T1 arg1);
//typedef M CreatorMa2<M extends Monad<Ma>, Ma, T1, T2>(T1 arg1, T2 arg2);
//typedef M CreatorMa3<M extends Monad<Ma>, Ma, T1, T2, T3>(T1 arg1, T2 arg2, T3 arg3);

//typedef MOut ConverterM<M extends Monad, MIn extends M, MOut extends M>(MIn source);
//typedef MaOut ConverterMa<M extends Monad<Ma>, Ma, MaIn extends M, MaOut extends M>(MaIn source);

/*
 * LifterM :: Monad m => (T -> R) -> (m T -> m R)
 * Allows a Func1 to act inside the Monad
 */
/*
typedef Func1<T, R> TargeterMLifterM<M extends Monad, T, R>(M target);

typedef M LifterM<M extends Monad, T, R>(Func1<T, R> liftee);

typedef Iterable<M> MapperM<M extends Monad, Ma, T>(Iterable<T> source);

typedef MapperM<M, T, R> LifterMMapperM<M extends Monad, T, R>(Func1<T, R> liftee);

typedef LifterM<M, T, R> DefLifterM<M extends Monad, T, R>(R def);

typedef LifterMMapperM<M, T, R> DefLifterMapperM<M extends Monad, T, R>(R def);

typedef dynamic ExtractorM<M extends Monad>(M target);

typedef Iterable<dynamic> MapperMExtractorM<M extends Monad>(Iterable<M> source);

typedef ExtractorM<M> DefExtractorM<M extends Monad>(dynamic def);

typedef MapperMExtractorM<M> DefMapperExtractorM<M extends Monad>(dynamic def);

typedef ExtractorM<M> LifterMExtractorM<M extends Monad, T, R>(Func1<T, R> liftee);

typedef ExtractorM<M> CreatorMa1ExtractorM<M extends Monad, Ma, T1>(CreatorMa1<M, Ma, T1> creator);

typedef MapperMExtractorMT<M, Ma> CreatorMa1MapperMExtractorMT<M extends Monad, Ma, T1>(CreatorMa1<M, Ma, T1> creator);

typedef LifterMExtractorM DefLifterExtractorM<M extends Monad, T, R>(dynamic def);

typedef T ExtractorMT<M extends Monad, T>(M target);

typedef Iterable<T> MapperMExtractorMT<M extends Monad, T>(Iterable<M> source);

typedef CreatorMa1<M, Mb, Ma> TargeterMBinderM<M extends Monad, Ma, Mb>(M target);

typedef Monad BinderM<M extends Monad, Ma, Mb>(M target, CreatorMa1<M, Mb, Ma> creator);

*/