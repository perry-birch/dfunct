library typedefs_common;

typedef void Unit();
typedef T UnitT<T>();
typedef bool Predicate<T>(T target);
typedef void Thunk();
typedef void Callback0();
typedef void Callback1<T>(T x);
typedef void Callback2<T1, T2>(T1 x, T2 y);
typedef int Comparator<T>(T a, T b);
typedef TOut Converter<TIn, TOut>(TIn source);
typedef T Proxier<T>(T source);
typedef TResult Func<TResult>();
typedef TResult Func1<T1, TResult>(T1 arg1);
typedef TResult Func2<T1, T2, TResult>(T1 arg1, T2 arg2);
typedef TResult Func3<T1, T2, T3, TResult>(T1 arg1, T2 arg2, T3 arg3);
typedef void Action();
typedef void Action1<T1>(T1 arg1);
typedef void Action2<T1, T2>(T1 arg1, T2 arg2);
typedef void Action3<T1, T2, T3>(T1 arg1, T2 arg2, T3 arg3);

