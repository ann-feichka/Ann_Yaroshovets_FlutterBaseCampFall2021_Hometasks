import 'package:campnotes/screens/auth_type_selector_screen.dart';
import 'package:campnotes/screens/login_screen.dart';
import 'package:campnotes/screens/registration_screen.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:campnotes/localization.dart';
import 'package:campnotes/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    TodosApp(),
  );
}

class TodosApp extends StatefulWidget {
  @override
  State<TodosApp> createState() => _TodosAppState();
}

class _TodosAppState extends State<TodosApp> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: FlutterBlocLocalizations().appTitle,
      theme: ArchSampleTheme.theme,
      localizationsDelegates: [
        ArchSampleLocalizationsDelegate(),
        FlutterBlocLocalizationsDelegate(),
      ],
      initialRoute: ArchSampleRoutes.authSelector,
      routes: {
        ArchSampleRoutes.home: (context) {
          return HomeScreen();
        },
        ArchSampleRoutes.addTodo: (context) {
          return AddEditScreen(
            key: ArchSampleKeys.addTodoScreen,
            onSave: (task, note) {},
            isEditing: false,
          );
        },
        ArchSampleRoutes.registration: (context) {
          return RegistrationScreen();
  },
        ArchSampleRoutes.login: (context) {
          return LoginScreen();
        },
        ArchSampleRoutes.authSelector: (context) {
          return AuthTypeSelectorScreen();
        },

      },
    );
  }
}
