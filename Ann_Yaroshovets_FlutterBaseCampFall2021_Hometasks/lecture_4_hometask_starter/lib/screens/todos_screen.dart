import 'package:campnotes/widgets/extra_actions.dart';
import 'package:campnotes/widgets/filter_button.dart';
import 'package:campnotes/widgets/filtered_todos.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

import '../localization.dart';

class TodosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FlutterBlocLocalizations.of(context).appTitle),
        actions: [
          FilterButton(visible: true),
          ExtraActions(),
        ],
      ),
      body: FilteredTodos(),
    );
  }
}
