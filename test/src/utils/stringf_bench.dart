part of dfunct_bench;

import 'package:dfunct/dfunct.dart';

part 'src/utils/stringf_bench.dart';

void main() {

  var printer = () => print('testing');
  var toLower = () {

  }

  var benchmark = Dmark.define();

  benchmark('Printer', printer);

  //stringf_bench();
}


class TemplateBenchmark extends BenchmarkBase {
  const TemplateBenchmark() : super("TemplateName");

  static void main() {
    new TemplateBenchmark().report();
  }
  void run() { }

  // Not measured: setup code executed before the benchmark runs.
  void setup() { }

  // Not measured: teardown code executed after the benchmark runs.
  void teardown() { }
}

/*
// Create a new benchmark by extending BenchmarkBase.
class Stringf_Benchmarks extends BenchmarkBase {
  const Stringf_Benchmarks() : super("Strinf");

  static void main() {
    new Stringf_Benchmarks().report();
  }

  static final var value = "ALL THE STRINGS ARE UPPER";

  // The benchmark code.
  void run() {


    //var lower1 = value.toLowerCase();
    var lower1 = Stringf.toLower(value);
  }

  // Not measured: setup code executed before the benchmark runs.
  void setup() { }

  // Not measured: teardown code executed after the benchmark runs.
  void teardown() { }
}

class Stringf_Benchmarks extends

// Main function runs the benchmark.
stringf_bench() {
  // Run TemplateBenchmark.
  RouterBenchmark.main();
}
*/

//var printer = () => print('done 1');

//var d = new Dmark.define()(printer)



//Template(RunTime): 4.536639030973903 us.
//Template(RunTime): 4.556369120575196 us.
//Template(RunTime): 4.657564233632737 us.