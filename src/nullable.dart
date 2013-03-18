library nullable;

import 'monad.dart';

class Nullable<T> extends Monad {
  final T value;
  final bool hasValue;
  Nullable._internal(this.value, this.hasValue);
  factory Nullable(T value) {
    return new Nullable._internal(value, value != null);
  }
  //bool hasValue() => value != null;
  //Nullable bind(map<dynamic, dynamic> map) {
  //  return bind(this, map);
  //}
  //final binderM<Nullable<T>, dynamic, Nullable, dynamic> bind = (Nullable target, map<dynamic, Nullable> map) {
  //  return null;
  //};

  static final binderM<Nullable, dynamic, Nullable, dynamic> bindNullable = (Nullable target, returnMTR<Nullable, dynamic, dynamic> returnM) {
    return null;
  };

  Nullable bind(returnMTR<Nullable, dynamic, dynamic> returnM) {
    return Nullable.bindNullable(this, returnM);
  }

  Monad operator >>(returnM returnM) {
    return bind(returnM);
  }
}
//Nullable Nullable_unit(value) {
//  return new Nullable(value);
//}
//Nullable ApplyFunction(Nullable nullable, func) {
//  if(nullable.hasValue())
//}