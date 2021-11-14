
import 'package:flutter_bloc/flutter_bloc.dart';
import '../hash_calculator/spawned_isolate_task_performer.dart';
import '../heavy_task_state.dart';

class HeavyTaskCubit extends Cubit<HeavyTaskState>{
  SpawnedIsolateTaskPerformer taskPerformer = SpawnedIsolateTaskPerformer();
  HeavyTaskCubit() : super(HeavyTaskPerformState());

  void stopCalculate() async {
    taskPerformer.stopDoSomeHeavyWork();
    emit(HeavyTaskStoppedState());
  }

  void startCalculate(int iterationCount) async {
    emit(HeavyTaskWaitingState());
    HeavyTaskPerformState.result = await taskPerformer.doSomeHeavyWork(iterationCount);
    emit(HeavyTaskPerformState());
  }
}