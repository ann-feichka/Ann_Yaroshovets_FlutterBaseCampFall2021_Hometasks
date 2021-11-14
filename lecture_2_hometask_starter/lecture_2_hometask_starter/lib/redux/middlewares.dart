import 'package:flutter/cupertino.dart';
import 'package:lecture_2_hometask_starter/hash_calculator/spawned_isolate_task_performer.dart';
import 'package:lecture_2_hometask_starter/redux/actions.dart';
import 'package:lecture_2_hometask_starter/redux/app_state.dart';
import 'package:redux/redux.dart';
import '../constants.dart';


void loaderMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher nextDispatcher) {
  if (action is StartCalculateAction) {
    _getResult(action.iterationCount)
        .then((result) => store.dispatch(GetTaskResultAction(result)));
  }
  else if (action is StopCalculateAction) {
    _stopTask();
  }

  nextDispatcher(action);
}

SpawnedIsolateTaskPerformer taskPerformer = SpawnedIsolateTaskPerformer();

Future<Widget> _getResult(int iterationCount) async {
   String result =await taskPerformer.doSomeHeavyWork(iterationCount);
   return Text(result);
}
void _stopTask() async{
  taskPerformer.stopDoSomeHeavyWork();
}
