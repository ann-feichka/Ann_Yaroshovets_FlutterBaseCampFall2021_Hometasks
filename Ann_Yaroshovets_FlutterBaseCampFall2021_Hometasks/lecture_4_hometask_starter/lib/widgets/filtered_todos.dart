import 'package:campnotes/bloc/models/app_tab.dart';
import 'package:campnotes/helpers/mocks.dart';
import 'package:campnotes/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todos_app_core/todos_app_core.dart';

class FilteredTodos extends StatelessWidget {
  final AppTab tab;
  final ScrollController controller;

  FilteredTodos({Key key, this.tab, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);

    final todos = mockTodos;
    return ListView.builder(
      controller: controller,
      key: ArchSampleKeys.todoList,
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = todos[index];
        return TodoItem(
          tab: tab,
          todo: todo,
          onDismissed: (direction) {
            ScaffoldMessenger.of(context).showSnackBar(DeleteTodoSnackBar(
              key: ArchSampleKeys.snackbar,
              todo: todo,
              onUndo: () {},
              localizations: localizations,
            ));
          },
          onTap: () async {
            Navigator.of(context).pushNamed(
              ArchSampleRoutes.details,
              arguments: todo.id,
            );
          },
          onCheckboxChanged: (_) {},
        );
      },
    );
  }
}
