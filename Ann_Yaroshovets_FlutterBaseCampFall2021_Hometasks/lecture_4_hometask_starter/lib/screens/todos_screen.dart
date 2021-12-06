import 'package:campnotes/bloc/models/app_tab.dart';
import 'package:campnotes/localization.dart';
import 'package:campnotes/widgets/float_action_button_short.dart';
import 'package:campnotes/widgets/float_action_button_with_text.dart';
import 'package:campnotes/widgets/extra_actions.dart';
import 'package:campnotes/widgets/filter_button.dart';
import 'package:campnotes/widgets/filtered_todos.dart';
import 'package:flutter/material.dart';

class TodosScreen extends StatefulWidget {
  final AppTab tab;

  const TodosScreen({Key key, this.tab}) : super(key: key);

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  ScrollController _scrollController = new ScrollController();
  bool isFAB = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 5) {
        setState(() {
          isFAB = true;
        });
      } else {
        setState(() {
          isFAB = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          isFAB ? buildFAB(widget.tab) : buildExtendedFAB(widget.tab),
      appBar: AppBar(
        title: Text(FlutterBlocLocalizations().appTitle),
        actions: [
          FilterButton(visible: true),
          ExtraActions(),
        ],
      ),
      body: FilteredTodos(
        tab: widget.tab,
        controller: _scrollController,
      ),
    );
  }
}
