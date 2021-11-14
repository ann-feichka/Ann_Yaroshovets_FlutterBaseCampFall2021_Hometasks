abstract class HeavyTaskState {}

class HeavyTaskPerformState extends HeavyTaskState{
  static String result ='';
}

class HeavyTaskStoppedState extends HeavyTaskState{}

class HeavyTaskWaitingState extends HeavyTaskState{}