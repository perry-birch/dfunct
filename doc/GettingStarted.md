Currently only the Maybe monad is implemented so there isn't much to add here, in progress!

There are usage examples in the test folder for sections that are fleshed out more.

** Maybe **

* Option *
Provides a conceptual model for Just or Nothing through polymorphism

* Just *
A container which has a value
* Private ctor can be accessed through Maybe ctor with any non-null value
* Can also be constructed using Maybe.just(value)
* - Passing a null to Maybe.just will yield a Nothing

* Nothing *
An explicit 'null' realized as a type
* Private ctor can be accessed through Maybe ctor with a null value
* Can also be constructed using Maybe.nothing()


- Maybe.nothing()
- Maybe.just(value)
- Maybe.isJust(target)
- Maybe.isNothing(target)
- Maybe.fromJust(target)
- Maybe.fromMaybe(def, target)
- Maybe.maybe(def, map, target)
- Maybe.listToMaybe(list)
- Maybe.maybeToList(target)
- Maybe.catMaybes(source)
- Maybe.mapMaybe(reutrnM, source)
- Maybe.bindMaybe(target, returnM)
- Operator: >>(returnM)