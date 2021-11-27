import 'package:campnotes/localization.dart';
import 'package:campnotes/widgets/extra_actions.dart';
import 'package:campnotes/widgets/filter_button.dart';
import 'package:campnotes/widgets/filtered_todos.dart';
import 'package:flutter/material.dart';

class TodosScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FlutterBlocLocalizations().appTitle),
        actions: [
          FilterButton(visible: true),
          ExtraActions(),
        ],
      ),
      body: FilteredTodos(),
    );
  }


}
