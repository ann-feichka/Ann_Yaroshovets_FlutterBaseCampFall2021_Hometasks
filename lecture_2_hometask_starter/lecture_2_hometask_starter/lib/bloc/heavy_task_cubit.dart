import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../hash_calculator/spawned_isolate_task_performer.dart';
import '../heavy_task_state.dart';

class HeavyTaskCubit extends Cubit<HeavyTaskState> {
  CancelableOperation<String?>? _heavyTaskOperation;
  String result = '';
  SpawnedIsolateTaskPerformer taskPerformer = SpawnedIsolateTaskPerformer();
  HeavyTaskCubit() : super(HeavyTaskPerformState(''));
  void stopCalculate() async {
    taskPerformer.stopDoSomeHeavyWork();
    _heavyTaskOperation?.cancel();
  }

  void startCalculate(int iterationCount) async {
    emit(HeavyTaskWaitingState());
    _heavyTaskOperation = CancelableOperation.fromFuture(
      taskPerformer.doSomeHeavyWork(iterationCount),
      onCancel: () {
        emit(HeavyTaskStoppedState());
      },
    );
    final result = await _heavyTaskOperation!.value;
    if (result != null) {
      emit(HeavyTaskPerformState(result));
    }
  }
}
