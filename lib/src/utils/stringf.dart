library stringf;

import '../typedefs/common.dart';
import 'charf.dart';

class Stringf {

  static final Converter<String, String> toLower = (String source) {
    var sb = new StringBuffer();

    source.codeUnits.forEach(
        (char) => sb.writeCharCode(Charf.toLower(char))
        );

    return sb.toString();
  };
}