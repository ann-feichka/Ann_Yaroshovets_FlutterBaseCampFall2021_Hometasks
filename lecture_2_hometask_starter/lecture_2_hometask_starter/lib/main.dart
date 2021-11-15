import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/heavy_task_cubit.dart';
import 'widgets/heavy_task_cubit_builder.dart';
import 'heavy_task_state.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => HeavyTaskCubit(),
          child: CalculateHashPage(),
        ));
  }
}

class CalculateHashPage extends StatelessWidget {
  TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculate Hash Page Bloc'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: myController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Iteration Count',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text('Heavy task result is equal to:'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: HeavyTaskCubitBuilder(),
              ),
              ElevatedButton(
                onPressed: () => context.read<HeavyTaskCubit>().stopCalculate(),
                child: const Text('Stop Heavy Task'),
              ),
              ElevatedButton(
                onPressed: () => context
                    .read<HeavyTaskCubit>()
                    .startCalculate(int.parse(myController.text)),
                child: const Text('Perform Heavy Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
