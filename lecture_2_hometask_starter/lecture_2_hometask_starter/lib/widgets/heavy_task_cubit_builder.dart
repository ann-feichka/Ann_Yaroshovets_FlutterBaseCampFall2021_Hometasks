
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/heavy_task_cubit.dart';
import '../heavy_task_state.dart';

class HeavyTaskCubitBuilder extends StatelessWidget {
  final WidgetBuilder buildPerformState;

  const HeavyTaskCubitBuilder({Key? key, required this.buildPerformState}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeavyTaskCubit,HeavyTaskState>(
      builder: (context,state) {
        if(state is HeavyTaskPerformState){
          return buildPerformState(context);
        }
        if(state is HeavyTaskStoppedState){
          return const Text("Stopped");
        }
        return const CircularProgressIndicator.adaptive();
      },
    );
  }
}
