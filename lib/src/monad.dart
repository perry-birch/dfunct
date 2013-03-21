library monad;

import 'typedefs.dart';

abstract class Monad<T> {
  Monad bind(returnMTR<Monad, T, dynamic> returnM);

  //Monad operator >>(returnM returnM);
}