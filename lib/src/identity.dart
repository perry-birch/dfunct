library identity;

import 'monad.dart';

class IdentityMonad<T> {
  final T value;
  IdentityMonad(this.value);
}


//IdentityMonad<T> createIdentityMonad<T>(T value) => new IdentityMonad(value);

//abstract class IO<T> {

//}


identity (value) {
  return () => value;
}