import 'package:campnotes/data/shared_preferences_storage.dart';
import 'package:campnotes/widgets/extra_actions.dart';
import 'package:campnotes/widgets/filter_button.dart';
import 'package:campnotes/widgets/filtered_todos.dart';
import 'package:flutter/material.dart';

class TodosScreen extends StatefulWidget {
  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  String _email = "";

  @override
  void initState() {
    SharedPreferencesStorage.getData("email").then(updateEmail);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_email} todos"),
        actions: [
          FilterButton(visible: true),
          ExtraActions(),
        ],
      ),
      body: FilteredTodos(),
    );
  }

  void updateEmail(String email) {
    setState(() {
      this._email = email;
    });
  }
}
