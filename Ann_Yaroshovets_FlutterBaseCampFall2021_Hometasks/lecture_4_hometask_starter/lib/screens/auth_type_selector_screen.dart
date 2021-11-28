import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

class AuthTypeSelectorScreen extends StatelessWidget {
  const AuthTypeSelectorScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(onPressed:(){
            Navigator.pushReplacementNamed(context, ArchSampleRoutes.registration);
          }, child: Text(ArchSampleLocalizations.of(context).registration)),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacementNamed(context, ArchSampleRoutes.login);
          }, child: Text(ArchSampleLocalizations.of(context).login))
        ],
      ),
    );
  }
}
