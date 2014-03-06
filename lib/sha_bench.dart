
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:crypto/crypto.dart' as crypto;

// Dart cmd-line:
//inflate(RunTime)  :   4,044.4444444444443 us.
//deflate(RunTime)  :  19,346.153846153848 us.
//plain sha(RunTime):  67,000.0 us.

// Dart web:
//inflate(RunTime)  :   3,602.517985611511 us.
//deflate(RunTime)  :  21,351.063829787236 us.
//plain sha(RunTime): 188,181.81818181818 us.

// dart2js web:
//inflate(RunTime)  :   6,734.006734006734 us.
//deflate(RunTime)  :  35,892.857142857145 us.
//plain sha(RunTime): 280,500.0 us.
//plain sha(RunTime): 271,875.0 us. (precompiled.js)

void runBenchmarks() {
  runBenchmark(new InflateBenchmark());
  runBenchmark(new DeflateBenchmark());
  runBenchmark(new ShaBenchmark());
}

void runBenchmark(BenchmarkBase benchmark) {
  benchmark.report();
}

class InflateBenchmark extends BenchmarkBase {
  List data;

  InflateBenchmark() : super('inflate');

  void setup() {
    data = new Deflate(_createData(100000)).getBytes();
  }

  void run() {
    new Inflate(data).getBytes();
  }
}

class DeflateBenchmark extends BenchmarkBase {
  List data = _createData(100000);

  DeflateBenchmark() : super('deflate');

  void run() {
    new Deflate(data).getBytes();
  }
}

class ShaBenchmark extends BenchmarkBase {
  List data = _createData(100000);

  ShaBenchmark() : super('plain sha');

  void run() {
    crypto.SHA1 sha1 = new crypto.SHA1();
    sha1.add(data);
    sha1.close();
  }
}

List _createData(int size) {
  Uint8List data = new Uint8List(size);
  for (int i = data.length - 1; i >= 0; i--) {
    data[i] = ((i * i) ^ i) & 0xFF;
  }
  return data;
}
