import 'package:flutter/cupertino.dart';

class StopCalculateAction {}

class StartCalculateAction {
  final int iterationCount;

  StartCalculateAction(this.iterationCount);
}

class GetTaskResultAction {
  final Widget widget;

  GetTaskResultAction(this.widget);
}