Feedback and suggestions are always welcome & appreciated.

Check out the common typedefs, would love to know if these structures are helpful to others.

Currently only the Maybe monad is implemented so there isn't much to add here, in progress!

Utils section is not stable (or particularly useful) yet.
Playing with some ideas on String utilities using SIMD...

There are usage examples in the test folder for sections that are fleshed out more.

** Maybe **

* Instance *

- bind(Creator1<Maybe, dynamic> creator)
- map(Func1<T, dynamic> mapper)
- Operator: >>			:: (Creator1<Maybe, dynamic> creator) [aka bind]
- Operator: <<			:: (dynamic def) [aka fromMaybe]
- Operator: |			:: (Func1<T, dynamic> mapper) [aka map]

* Static *

- Maybe.from 			:: (dynamic value) -> Maybe
- Maybe.nothing 		:: () -> Maybe
- Maybe.just			:: (value) -> Maybe
- Maybe.isJust			:: (Maybe target) -> bool
- Maybe.isNothing		:: (Maybe target) -> bool
- Maybe.fromJust		:: (Maybe target) -> dynamic
- Maybe.fromMaybe		:: (dynamic def) ->(Maybe target) -> dynamic
- Maybe.maybe			:: (dynamic def) -> (Func1<dynamic, dynamic> map) -> (Maybe target) -> dynamic
- Maybe.listToMaybe		:: (Iterable source) -> Maybe
- Maybe.maybeToList		:: (Maybe target) -> [dynamic]
- Maybe.catMaybes		:: (Iterable<Maybe> source) -> [dynamic]
- Maybe.mapMaybe		:: (Maybe target) -> (Func1<dynamic, dynamic> mapper) -> Maybe
- Maybe.mapReduceMaybe	:: (Creator1<Maybe, dynamic> creator) -> (Iterable<dynamic> source) -> Iterable<dynamic>
- Maybe.bindMaybe		:: (Maybe target) -> (Creator1<Maybe, dynamic> creator) -> Maybe