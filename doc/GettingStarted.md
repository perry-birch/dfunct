Currently only the Maybe monad is implemented so there isn't much to add here, in progress!

There are usage examples in the test folder for sections that are fleshed out more.

** Maybe **

- Maybe.from(value)
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