library identity;

import '../typedefs/common.dart';
import 'monad.dart';

class Identity<T1> implements Monad<T1> {
  final T1 _value;
  const Identity._internal(this._value);

  Identity bind(Creator1<Identity, dynamic> creator) {
    return new Identity._internal(10);
  }

  dynamic map(Func1<T1, dynamic> mapper) {
    return null;
  }
}