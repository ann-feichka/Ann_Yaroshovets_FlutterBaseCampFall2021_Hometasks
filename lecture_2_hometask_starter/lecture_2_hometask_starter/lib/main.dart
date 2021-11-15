import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lecture_2_hometask_starter/redux/actions.dart';
import 'package:lecture_2_hometask_starter/redux/app_state.dart';
import 'package:lecture_2_hometask_starter/redux/middlewares.dart';
import 'package:lecture_2_hometask_starter/redux/reducers.dart';
import 'hash_calculator/spawned_isolate_task_performer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


void main() {
  final store = Store<AppState>(reducer,
      initialState: AppState(widget: const Center(child: Text("Defolt"))),
  middleware: [loaderMiddleware]);
  runApp(StoreProvider(
      store: store, child: MaterialApp(
    debugShowCheckedModeBanner: false ,
      home: _CalculateHashPage())));
  }


class _CalculateHashPage extends StatelessWidget {
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculate Hash Page Redux'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            controller: myController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Iteration Count',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],),
        ),
        const SizedBox(height: 50,),
        const Text('Heavy task result is equal to:'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child:StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (context, vm) => vm.widget,
          ),
        ),
        ElevatedButton(
            onPressed: () => store.dispatch(StartCalculateAction(int.parse(myController.text))),
            child: const Text('Perform Heavy Task'),
      ),
      ElevatedButton(
        onPressed: () => store.dispatch(StopCalculateAction()),
        child: const Text('Stop Heavy Task'),
      ),
      ],
    ),)
    ,
    )
    ,
    );
  }
}
