import 'package:campnotes/bloc/models/app_tab.dart';
import 'package:campnotes/widgets/stack_navigator_child.dart';
import 'package:campnotes/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

import '../data/network/fire_auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppTab _currentTab = AppTab.home;

  Map<AppTab, GlobalKey<NavigatorState>> navigatorKeys = {
    AppTab.home: GlobalKey<NavigatorState>(),
    AppTab.work: GlobalKey<NavigatorState>(),
    AppTab.leisure: GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final hasPopped =
            await navigatorKeys[_currentTab].currentState.maybePop();

        if (hasPopped) {
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          key: ArchSampleKeys.addTodoFab,
          onPressed: () async {
            FireAuth.signOut().whenComplete(() =>
                Navigator.of(context).pushNamed(ArchSampleRoutes.authSelector));
          },
          child: Icon(Icons.logout),
          tooltip: ArchSampleLocalizations.of(context).addTodo,
        ),
        body: Stack(
          children: [
            StackNavigatorChild(
              AppTab.home,
              _currentTab == AppTab.home,
              navigatorKeys[AppTab.home],
            ),
            StackNavigatorChild(
              AppTab.work,
              _currentTab == AppTab.work,
              navigatorKeys[AppTab.work],
            ),
            StackNavigatorChild(
              AppTab.leisure,
              _currentTab == AppTab.leisure,
              navigatorKeys[AppTab.leisure],
            ),
          ],
        ),
        bottomNavigationBar: TabSelector(
            activeTab: _currentTab,
            onTabSelected: (AppTab newTab) {
              setState(() {
                _currentTab = newTab;
                navigatorKeys[AppTab.home]
                    .currentState
                    .popUntil(ModalRoute.withName('/'));
                navigatorKeys[AppTab.work]
                    .currentState
                    .popUntil(ModalRoute.withName('/'));
              });
            }),
      ),
    );
  }
}
