
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'actions.dart';
import 'app_state.dart';

AppState reducer(AppState state, dynamic action) => AppState(
    widget: _taskReducer(state.widget, action));

Reducer<Widget> _taskReducer = combineReducers(
    [TypedReducer(_startCalculateAction), TypedReducer(_getTaskResultAction),TypedReducer(_stopAction)]);

Widget _startCalculateAction(Widget widget, StartCalculateAction action) =>
    const Center(child: CircularProgressIndicator());

Widget _getTaskResultAction(Widget widget, GetTaskResultAction action) =>
    action.widget;

Widget _stopAction(Widget widget, StopCalculateAction action) =>
    Center(child: const Text("Stopped"));
