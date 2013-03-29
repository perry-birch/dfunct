library monad;

import '../typedefs/common.dart';

abstract class Functor<T> {
  // fmap :: (a -> b) -> f a -> f b
  Functor map(Func1<T, dynamic> map);
}

abstract class Monad<T> extends Functor<T> {
  // return :: a -> m a
  // bind/>>= :: m a -> (a -> m b) -> m b
  // >> :: m a -> m b -> m b
  // fail :: String -> m a
  // fail msg = error msg

  Monad bind(Creator1<Monad, dynamic> creator);
}
/*
abstract class Monad1<T1> extends Monad {
  //Monad bind(Creator1<Monad, T1> creator);

  //Monad operator >>(returnM returnM);
}*/