import 'package:campnotes/bloc/models/app_tab.dart';
import 'package:campnotes/screens/details_screen.dart';
import 'package:campnotes/screens/todos_screen.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

class StackNavigatorChild extends StatelessWidget {
  final AppTab tab;
  final bool isVisible;
  final GlobalKey<NavigatorState> navigationKey;

  const StackNavigatorChild(this.tab, this.isVisible, this.navigationKey,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !isVisible,
      child: Container(
        child: Navigator(
          key: navigationKey,
          initialRoute: '/',
          // ignore: missing_return
          onGenerateRoute: (RouteSettings settings) {
            final String routeName = settings.name ?? ArchSampleRoutes.home;

            if (routeName == ArchSampleRoutes.home) {
              return MaterialPageRoute(
                settings: settings,
                builder: (_) {
                  return TodosScreen();
                },
              );
            }

            if (routeName == ArchSampleRoutes.details) {
              final String id = settings.arguments;

              return MaterialPageRoute(
                settings: settings,
                builder: (_) {
                  return DetailsScreen(
                    id: id,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
