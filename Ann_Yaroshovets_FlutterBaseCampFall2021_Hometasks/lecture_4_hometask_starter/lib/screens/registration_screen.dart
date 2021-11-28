import 'package:campnotes/data/shared_preferences_storage.dart';
import 'package:campnotes/validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos_app_core/todos_app_core.dart';

SharedPreferences localStorage;

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool password = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                ArchSampleLocalizations.of(context).registration,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Form(
              key: _formKey,
                child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 15.0),
                  child: TextFormField(
                    validator: (value) => Validator.validateEmail(email: _emailController.text),
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18.0),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      ),
                      labelText: ArchSampleLocalizations.of(context).email,
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 15.0),
                  child: TextFormField(
                    validator: (value) => Validator.validatePassword(password: value),
                    controller: _passwordController,
                    obscureText: password,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(fontSize: 18.0),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0)),
                        ),
                        labelText: ArchSampleLocalizations.of(context).password,
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(password
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              password = !password;
                            });
                          },
                        )),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if(_formKey.currentState.validate())
                    {
                      await SharedPreferencesStorage.init();
                      SharedPreferencesStorage.setData(
                          "email", _emailController.text);
                      SharedPreferencesStorage.setData(
                          "password", _passwordController.text);
                      SharedPreferencesStorage.setBool("token", true);
                      Navigator.pushReplacementNamed(context, ArchSampleRoutes.home);
                    }},
                    child: Text(ArchSampleLocalizations.of(context).signUp),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(100.0))))),
              ],
            )),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
