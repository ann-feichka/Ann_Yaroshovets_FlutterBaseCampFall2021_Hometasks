abstract class HeavyTaskState {}

class HeavyTaskPerformState extends HeavyTaskState{
   final String result ;
   HeavyTaskPerformState(this.result);
}

class HeavyTaskStoppedState extends HeavyTaskState{}

class HeavyTaskWaitingState extends HeavyTaskState{}