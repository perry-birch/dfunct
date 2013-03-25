library typedefs;

import 'typedefs_common.dart';
import 'monad.dart';


/*
 * CreaterM :: Monad m => () -> m dynamic
 * Creates a dynamic Monad from unit, aka factory
 */
typedef M Creator<M>();
typedef M CreatorM<M extends Monad>();
/*
 * CreatorM(n) :: Monad m => dynamic -> m dynamic
 * Creates a dynamic Monad from value(s)
 */
typedef M Creator1<M, T1>(T1 arg1);
typedef M Creator2<M, T1, T2>(T1 arg1, T2 arg2);
typedef M Creator3<M, T1, T2, T3>(T1 arg1, T2 arg2, T3 arg3);

typedef M CreatorM1<M extends Monad, T1>(T1 arg1);
typedef M CreatorM2<M extends Monad, T1, T2>(T1 arg1, T2 arg2);
typedef M CreatorM3<M extends Monad, T1, T2, T3>(T1 arg1, T2 arg2, T3 arg3);
/*
 * CreatorMa :: Monad m => () -> m T
 * Creates a typed Monad from unit, aka factory
 */
typedef M CreatorMa<M extends Monad<Ma>, Ma>();
typedef M WrapperMa<M extends Monad<Ma>, Ma>(Ma value);
/*
 * CreatorMa(n) :: Monad m => T -> m T
 * Creates a typed Monad from value(s)
 */
typedef M CreatorMa1<M extends Monad<Ma>, Ma, T1>(T1 arg1);
typedef M CreatorMa2<M extends Monad<Ma>, Ma, T1, T2>(T1 arg1, T2 arg2);
typedef M CreatorMa3<M extends Monad<Ma>, Ma, T1, T2, T3>(T1 arg1, T2 arg2, T3 arg3);

typedef MOut ConverterM<M extends Monad, MIn extends M, MOut extends M>(MIn source);
typedef MaOut ConverterMa<M extends Monad<Ma>, Ma, MaIn extends M, MaOut extends M>(MaIn source);

/*
 * LifterM :: Monad m => (T -> R) -> (m T -> m R)
 * Allows a Func1 to act inside the Monad
 */
typedef Func1<T, R> TargeterLifter<M, T, R>(M target);
typedef Func1<T, R> TargeterMLifterM<M extends Monad, T, R>(M target);

typedef M Lifter<M, T, R>(Func1<T, R> liftee);
typedef M LifterM<M extends Monad, T, R>(Func1<T, R> liftee);

typedef Iterable<M> Mapper<M, T>(Iterable<T> source);
typedef Iterable<M> MapperM<M extends Monad, Ma, T>(Iterable<T> source);

typedef Mapper<M, R> LifterMapper<M, T, R>(Func1<T, R> liftee);//Iterable<M> source);//, Func1<T, R> liftee);
typedef MapperM<M, T, R> LifterMMapperM<M extends Monad, T, R>(Func1<T, R> liftee);//Iterable<M> source);//, Func1<T, R> liftee);

typedef Lifter<M, T, R> DefLifter<M, T, R>(R def);
typedef LifterM<M, T, R> DefLifterM<M extends Monad, T, R>(R def);

typedef LifterMapper<M, T, R> DefLifterMapper<M, T, R>(R def);
typedef LifterMMapperM<M, T, R> DefLifterMapperM<M extends Monad, T, R>(R def);

typedef dynamic Extractor<M>(M target);
typedef dynamic ExtractorM<M extends Monad>(M target);

typedef Iterable<dynamic> MapperExtractor<M>(Iterable<M> source);
typedef Iterable<dynamic> MapperMExtractorM<M extends Monad>(Iterable<M> source);

typedef Extractor<M> DefExtractor<M>(dynamic def);
typedef ExtractorM<M> DefExtractorM<M extends Monad>(dynamic def);

typedef MapperExtractor<M> DefMapperExtractor<M>(dynamic def);
typedef MapperMExtractorM<M> DefMapperExtractorM<M extends Monad>(dynamic def);

typedef Extractor<M> LifterExtractor<M, T, R>(Func1<T, R> liftee);
typedef ExtractorM<M> LifterMExtractorM<M extends Monad, T, R>(Func1<T, R> liftee);

typedef Extractor<M> Creator1Extractor<M, T1>(Creator1<M, T1> creator);
typedef ExtractorM<M> CreatorMa1ExtractorM<M extends Monad, Ma, T1>(CreatorMa1<M, Ma, T1> creator);

typedef MapperExtractorT<M, Ma> Creator1MapperExtractorT<M, Ma, T1>(Creator1<M, T1> creator);
typedef MapperMExtractorMT<M, Ma> CreatorMa1MapperMExtractorMT<M extends Monad, Ma, T1>(CreatorMa1<M, Ma, T1> creator);

typedef LifterExtractor DefLifterExtractor<M, T, R>(dynamic def);
typedef LifterMExtractorM DefLifterExtractorM<M extends Monad, T, R>(dynamic def);

//typedef dynamic ExtractorMDef<M extends Monad>(dynamic def, M target);
//typedef Iterable<dynamic> MapExtractorMDef<M extends Monad>(dynamic def, Iterable<M> source);

typedef T ExtractorT<M, T>(M target);
typedef T ExtractorMT<M extends Monad, T>(M target);

typedef Iterable<T> MapperExtractorT<M, T>(Iterable<M> source);
typedef Iterable<T> MapperMExtractorMT<M extends Monad, T>(Iterable<M> source);

typedef ExtractorT<M, T> DefExtractorT<M, T>(T def);
typedef MapperExtractorT<M, T> DefMapperExtractorT<M, T>(T def);

//typedef Ma ExtractorMa<M extends Monad<Ma>, Ma>(M target);
//typedef Iterable<Ma> MapperMExtractorMa<M extends Monad<Ma>, Ma>(Iterable<M> source);

//typedef Ma ExtractorMaDef<M extends Monad<Ma>, Ma>(Ma def, M target);
//typedef Iterable<Ma> MapperMExtractorMa<M extends Monad<Ma>, Ma>(Ma def, Iterable<M> source);

typedef Creator1<M, Ma> TargeterBinder<M, Ma>(M target);
typedef CreatorMa1<M, Mb, Ma> TargeterMBinderM<M extends Monad, Ma, Mb>(M target);

typedef M Binder<M, Ma>(M target, Creator1<M, Ma> creator);
typedef Monad BinderM<M extends Monad, Ma, Mb>(M target, CreatorMa1<M, Mb, Ma> creator);
//typedef M bindM<M extends Monad<T>, T, MR extends Monad<R>, R>(M target, mapM<T, MR> map);
//typedef MR binderM<MT extends Monad<T>, T, MR extends Monad<R>, R>(MT target, returnMTR<MR, T, R> returnM);