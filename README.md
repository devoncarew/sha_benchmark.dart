# sha_benchmark.dart

A benchmark for the Dart SHA implementation

## Dart cmd-line:
- inflate(RunTime)  :   4,044.4444444444443 us.
- deflate(RunTime)  :  19,346.153846153848 us.
- plain sha(RunTime):  67,000.0 us.

## Dartium:
- inflate(RunTime)  :   3,602.517985611511 us.
- deflate(RunTime)  :  21,351.063829787236 us.
- plain sha(RunTime): 188,181.81818181818 us.

## dart2js web:
- inflate(RunTime)  :   6,734.006734006734 us.
- deflate(RunTime)  :  35,892.857142857145 us.
- plain sha(RunTime): 280,500.0 us.
- plain sha(RunTime): 271,875.0 us. (precompiled.js)
