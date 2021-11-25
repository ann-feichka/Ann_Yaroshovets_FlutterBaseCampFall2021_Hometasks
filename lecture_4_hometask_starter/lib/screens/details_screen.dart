import 'package:campnotes/data/models/todo.dart';
import 'package:campnotes/helpers/mocks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

class DetailsScreen extends StatelessWidget {
  final String id;

  const DetailsScreen({Key key, this.id})
      : super(key: key ?? ArchSampleKeys.todoDetailsScreen);

  @override
  Widget build(BuildContext context) {
    Todo findTodo(String id) =>
        mockTodos.firstWhere((element) => element.id == id);
    final myTodo = findTodo(id);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(ArchSampleLocalizations.of(context).todoDetails),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  myTodo.task,
                  style: textTheme.headline4,
                ),
                // Text(ArchSampleLocalizations.of(context).notesHint),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    myTodo.note,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
