import 'package:campnotes/bloc/models/app_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        key: ArchSampleKeys.tabs,
        currentIndex: AppTab.values.indexOf(activeTab),
        onTap: (index) => onTabSelected(AppTab.values[index]),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ArchSampleLocalizations.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: ArchSampleLocalizations.of(context).work,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: ArchSampleLocalizations.of(context).leisure,
          ),
        ]);
  }
}
