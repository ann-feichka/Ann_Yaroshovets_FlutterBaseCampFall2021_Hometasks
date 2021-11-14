import 'package:flutter/foundation.dart';
import 'package:lecture_2_hometask_starter/hash_calculator/heavy_task_performer.dart';
import 'package:lecture_2_hometask_starter/helpers/random_number_hash_calculator.dart';

import '../constants.dart';

class ComputeHeavyTaskPerformer implements HeavyTaskPerformer {
  late final int iterationCount;
  @override
  Future<String> doSomeHeavyWork(iterationCount) async {
    return compute<int,String>(RandomNumberHashCalculator().calculateRandomNumberHash,iterationCount);
  }

  @override
  Future<String> stopDoSomeHeavyWork() {
    // TODO: implement stopDoSomeHeavyWork
    throw UnimplementedError();
  }
}