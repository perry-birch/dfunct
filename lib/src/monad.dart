library monad;

import 'typedefs.dart';

abstract class Monad<T> {
  Monad bind(CreatorMa1<Monad, T, dynamic> returnM);

  //Monad operator >>(returnM returnM);
}