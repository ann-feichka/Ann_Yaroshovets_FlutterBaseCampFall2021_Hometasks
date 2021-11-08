import 'package:flutter/foundation.dart';
import 'package:lecture_2_hometask_starter/hash_calculator/heavy_task_performer.dart';
import 'package:lecture_2_hometask_starter/helpers/random_number_hash_calculator.dart';

import '../constants.dart';

class ComputeHeavyTaskPerformer implements HeavyTaskPerformer {

   static String _calculateHash (int count){
    return RandomNumberHashCalculator().calculateRandomNumberHash(iterationsCount: count);
  }

  @override
  Future<String> doSomeHeavyWork() async {
    return compute<int,String>(_calculateHash,DefaultIterationsCount);
  }
}