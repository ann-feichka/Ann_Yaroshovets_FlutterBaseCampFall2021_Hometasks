import 'dart:async';
import 'dart:isolate';

import 'package:lecture_2_hometask_starter/hash_calculator/heavy_task_performer.dart';
import 'package:lecture_2_hometask_starter/helpers/random_number_hash_calculator.dart';

import '../constants.dart';

class SpawnedIsolateTaskPerformer implements HeavyTaskPerformer {

  late Isolate isolate;
  late Completer _completer;

  @override
  Future doSomeHeavyWork() async {
    _completer = Completer<String>();

    try {
      final spawnerReceivePort = ReceivePort();
      isolate = await Isolate.spawn(
        _establishCommunicationWithSpawner,
        spawnerReceivePort.sendPort,
      );

      spawnerReceivePort.listen((message) {
        if (message is SendPort) {
          message.send(DefaultIterationsCount);
        } else if (message is String) {
          _completer.complete(message);
        }

      });
    } catch (e) {
      _completer.completeError(e);
    }
    return _completer.future;
  }


  static void _establishCommunicationWithSpawner(SendPort spawnerSendPort) {

    final hashCalculator = RandomNumberHashCalculator();

    final ReceivePort spawneeReceivePort = ReceivePort();
    spawnerSendPort.send(spawneeReceivePort.sendPort);

    spawneeReceivePort.listen((message) {
      if (message is int) {
        final result = hashCalculator.calculateRandomNumberHash(iterationsCount: message);
        spawnerSendPort.send(result);

        spawneeReceivePort.close();

    }});
  }
}
