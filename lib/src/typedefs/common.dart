library typedefs_common;

typedef void Thunk();
typedef bool Predicate<T1>(T1 target);
typedef int Comparator<T>(T a, T b);
typedef TOut Converter<TIn, TOut>(TIn source);
typedef T1 Proxier<T1>(T1 source);

typedef void Unit();
typedef T1 Unit1<T1>();

typedef TResult Func<TResult>();
typedef TResult Func1<T1, TResult>(T1 arg1);
typedef TResult Func2<T1, T2, TResult>(T1 arg1, T2 arg2);
typedef TResult Func3<T1, T2, T3, TResult>(T1 arg1, T2 arg2, T3 arg3);
typedef TResult Func4<T1, T2, T3, T4, TResult>(T1 arg1, T2 arg2, T3 arg3, T4 arg4);
typedef TResult Func5<T1, T2, T3, T4, T5, TResult>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5);
typedef TResult Func6<T1, T2, T3, T4, T5, T6, TResult>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6);

typedef Func<TResult> Func0_0<TResult>();
typedef Func<TResult> Func1_0<T1, TResult>(T1 arg1);
typedef Func<TResult> Func2_0<T1, T2, TResult>(T1 arg1, T2 arg2);
typedef Func<TResult> Func3_0<T1, T2, T3, TResult>(T1 arg1, T2 arg2, T3 arg3);
typedef Func<TResult> Func4_0<T1, T2, T3, T4, TResult>(T1 arg1, T2 arg2, T3 arg3, T4 arg4);
typedef Func<TResult> func5_0<T1, T2, T3, T4, T5, TResult>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5);
typedef Func<TResult> func6_0<T1, T2, T3, T4, T5, T6, TResult>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6);

typedef Func1<T_1, TResult> Func0_1<T_1, TResult>();
typedef Func1<T_1, TResult> Func1_1<T1, T_1, TResult>(T1 arg1);
typedef Func1<T_1, TResult> Func2_1<T1, T2, T_1, TResult>(T1 arg1, T2 arg2);
typedef Func1<T_1, TResult> Func3_1<T1, T2, T3, T_1, TResult>(T1 arg1, T2 arg2, T3 arg3);
typedef Func1<T_1, TResult> Func4_1<T1, T2, T3, T4, T_1, TResult>(T1 arg1, T2 arg2, T3 arg3, T4 arg4);
typedef Func1<T_1, TResult> Func5_1<T1, T2, T3, T4, T5, T_1, TResult>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5);
typedef Func1<T_1, TResult> Func6_1<T1, T2, T3, T4, T5, T6, T_1, TResult>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6);

typedef Func2<T_1, T_2, TResult> Func0_2<T_1, T_2, TResult>();
typedef Func2<T_1, T_2, TResult> Func1_2<T1, T_1, T_2, TResult>(T1 arg1);
typedef Func2<T_1, T_2, TResult> Func2_2<T1, T2, T_1, T_2, TResult>(T1 arg1, T2 arg2);
typedef Func2<T_1, T_2, TResult> Func3_2<T1, T2, T3, T_1, T_2, TResult>(T1 arg1, T2 arg2, T3 arg3);
typedef Func2<T_1, T_2, TResult> Func4_2<T1, T2, T3, T4, T_1, T_2, TResult>(T1 arg1, T2 arg2, T3 arg3, T4 arg4);
typedef Func2<T_1, T_2, TResult> Func5_2<T1, T2, T3, T4, T5, T_1, T_2, TResult>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5);
typedef Func2<T_1, T_2, TResult> Func6_2<T1, T2, T3, T4, T5, T6, T_1, T_2, TResult>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6);

typedef Func3<T_1, T_2, T_3, TResult> Func0_3<T_1, T_2, T_3, TResult>();
typedef Func3<T_1, T_2, T_3, TResult> Func1_3<T1, T_1, T_2, T_3, TResult>(T1 arg1);
typedef Func3<T_1, T_2, T_3, TResult> Func2_3<T1, T2, T_1, T_2, T_3, TResult>(T1 arg1, T2 arg2);
typedef Func3<T_1, T_2, T_3, TResult> Func3_3<T1, T2, T3, T_1, T_2, T_3, TResult>(T1 arg1, T2 arg2, T3 arg3);
typedef Func3<T_1, T_2, T_3, TResult> Func4_3<T1, T2, T3, T4, T_1, T_2, T_3, TResult>(T1 arg1, T2 arg2, T3 arg3, T4 arg4);
typedef Func3<T_1, T_2, T_3, TResult> Func5_3<T1, T2, T3, T4, T5, T_1, T_2, T_3, TResult>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5);
typedef Func3<T_1, T_2, T_3, TResult> Func6_3<T1, T2, T3, T4, T5, T6, T_1, T_2, T_3, TResult>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6);

typedef void Action();
typedef void Action1<T1>(T1 arg1);
typedef void Action2<T1, T2>(T1 arg1, T2 arg2);
typedef void Action3<T1, T2, T3>(T1 arg1, T2 arg2, T3 arg3);
typedef void Action4<T1, T2, T3, T4>(T1 arg1, T2 arg2, T3 arg3, T4 arg4);
typedef void Action5<T1, T2, T3, T4, T5>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5);
typedef void Action6<T1, T2, T3, T4, T5, T6>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6);

// Same signature as Func but implies a factory as opposed to an operation
typedef M Creator<M>();
typedef M Creator1<M, T1>(T1 arg1);
typedef M Creator2<M, T1, T2>(T1 arg1, T2 arg2);
typedef M Creator3<M, T1, T2, T3>(T1 arg1, T2 arg2, T3 arg3);
typedef M Creator4<M, T1, T2, T3, T4>(T1 arg1, T2 arg2, T3 arg3, T4 arg4);
typedef M Creator5<M, T1, T2, T3, T4, T5>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5);
typedef M Creator6<M, T1, T2, T3, T4, T5, T6>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6);

// Same signature as Action but iplies a re-entrant variety
typedef void Callback0();
typedef void Callback1<T1>(T1 arg1);
typedef void Callback2<T1, T2>(T1 arg1, T2 arg2);
typedef void Callback3<T1, T2, T3>(T1 arg1, T2 arg2, T3 arg3);
typedef void Callback4<T1, T2, T3, T4>(T1 arg1, T2 arg2, T3 arg3, T4 arg4);
typedef void Callback5<T1, T2, T3, T4, T5>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5);
typedef void Callback6<T1, T2, T3, T4, T5, T6>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6);

typedef T Defaulter<T>(T def); // can't use default due to keyword
typedef T Extractor<M, T>(M target);

typedef M Mapper<M, T, R>(Func1<T, R> mapper);


// Below is in flux trying to figure out better ways to deal with currying so pardon our dust...

//typedef Func<Defaulter<T>, Extractor<M, T>> DefaulterExtractor()
//typedef Extractor<M, T> DefaulterExtractor<M, T>(T def);
//typedef Iterable<T> MapperExtractor<M, T>(Iterable<M> source);

typedef Func1<T, R> TargeterLifter<M, T, R>(M target);
typedef Func1<T, R> TargeterMapper<M, T, R>(M target);



//typedef Mapper<M, R> LifterMapper<M, T, R>(Func1<T, R> liftee);
//typedef Lifter<M, T, R> DefLifter<M, T, R>(R def);
//typedef LifterMapper<M, T, R> DefLifterMapper<M, T, R>(R def);



//typedef MapperExtractor<M> DefMapperExtractor<M>(dynamic def);
typedef Extractor<M, T> LifterExtractor<M, T, R>(Func1<T, R> liftee);
//typedef Extractor<M> Creator1Extractor<M, T1>(Creator1<M, T1> creator);
typedef MapperExtractorT<M, Ma> Creator1MapperExtractorT<M, Ma, T1>(Creator1<M, T1> creator);
typedef LifterExtractor DefLifterExtractor<M, T, R>(dynamic def);

typedef Iterable<T> MapperExtractorT<M, T>(Iterable<M> source);
typedef Extractor<M, T> DefExtractor<M, T>(T def);
typedef MapperExtractorT<M, T> DefMapperExtractorT<M, T>(T def);
typedef Creator1<M, T2> TargeterBinder<M, T1, T2>(M target);
//typedef Creator1<M, T1> TargeterBinder1<M, T1>(M target);

//typedef M Binder<M, Ma>(M target, Creator1<M, Ma> creator);