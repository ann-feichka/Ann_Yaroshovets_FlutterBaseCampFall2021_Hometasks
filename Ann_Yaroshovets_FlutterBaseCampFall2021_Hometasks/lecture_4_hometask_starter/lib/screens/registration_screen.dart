import 'package:campnotes/data/network/fire_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos_app_core/todos_app_core.dart';

import '../validator.dart';

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
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OrientationBuilder(
            builder: (context, orientation) {
              return orientation == Orientation.portrait ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Text(
                          ArchSampleLocalizations
                              .of(context)
                              .registration,
                          textAlign: TextAlign.center,
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline4,
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
                                  validator: (value) =>
                                      Validator.validateEmail(email: value),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(fontSize: 18.0),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(100.0)),
                                    ),
                                    labelText:
                                    ArchSampleLocalizations
                                        .of(context)
                                        .email,
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
                                  validator: (value) =>
                                      Validator.validateName(name: value),
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(fontSize: 18.0),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(100.0)),
                                    ),
                                    labelText:
                                    ArchSampleLocalizations
                                        .of(context)
                                        .name,
                                    prefixIcon: Icon(
                                      Icons.person,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0, vertical: 15.0),
                                child: TextFormField(
                                  validator: (value) =>
                                      Validator.validatePassword(
                                          password: value),
                                  controller: _passwordController,
                                  obscureText: password,
                                  decoration: InputDecoration(
                                      labelStyle: TextStyle(fontSize: 18.0),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(
                                            Radius.circular(100.0)),
                                      ),
                                      labelText: ArchSampleLocalizations
                                          .of(context)
                                          .password,
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
                                    if (_formKey.currentState.validate()) {
                                      User user = await FireAuth
                                          .registerUsingEmailPassword(
                                          name: _nameController.text,
                                          email: _emailController.text,
                                          password: _passwordController.text
                                      );
                                      if (user != null)
                                        Navigator.pushReplacementNamed(
                                            context, ArchSampleRoutes.home);
                                    }
                                  },
                                  child: Text(
                                      ArchSampleLocalizations
                                          .of(context)
                                          .signUp),
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(100.0))))),
                            ],
                          )),
                    ],
                  )
              ) : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          ArchSampleLocalizations
                              .of(context)
                              .registration,
                          textAlign: TextAlign.center,
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline4,
                        ),
                      ),
                      Form(
                          key: _formKey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(children:<Widget> [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.longestSide/3,
                                    height: MediaQuery.of(context).size.shortestSide/8,
                                    child: TextFormField(
                                      validator: (value) =>
                                          Validator.validateEmail(email: value),
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _emailController,
                                      decoration: InputDecoration(
                                        labelStyle: TextStyle(fontSize: 18.0),
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(100.0)),
                                        ),
                                        labelText:
                                        ArchSampleLocalizations
                                            .of(context)
                                            .email,
                                        prefixIcon: Icon(
                                          Icons.email,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.longestSide/3,
                                    height: MediaQuery.of(context).size.shortestSide/8,
                                    child: TextFormField(
                                      validator: (value) =>
                                          Validator.validateName(name: value),
                                      controller: _nameController,
                                      decoration: InputDecoration(
                                        labelStyle: TextStyle(fontSize: 18.0),
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(100.0)),
                                        ),
                                        labelText:
                                        ArchSampleLocalizations
                                            .of(context)
                                            .name,
                                        prefixIcon: Icon(
                                          Icons.person,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.longestSide/3,
                                    height: MediaQuery.of(context).size.shortestSide/8,
                                    child: TextFormField(
                                      validator: (value) =>
                                          Validator.validatePassword(
                                              password: value),
                                      controller: _passwordController,
                                      obscureText: password,
                                      decoration: InputDecoration(
                                          labelStyle: TextStyle(fontSize: 18.0),
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.all(
                                                Radius.circular(100.0)),
                                          ),
                                          labelText: ArchSampleLocalizations
                                              .of(context)
                                              .password,
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
                                ),
                              ],),
                              SizedBox(
                                height: MediaQuery.of(context).size.shortestSide/8,
                                width: MediaQuery.of(context).size.longestSide/4,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        User user = await FireAuth
                                            .registerUsingEmailPassword(
                                            name: _nameController.text,
                                            email: _emailController.text,
                                            password: _passwordController.text
                                        );
                                        if (user != null)
                                          Navigator.pushReplacementNamed(
                                              context, ArchSampleRoutes.home);
                                      }
                                    },
                                    child: Text(
                                        ArchSampleLocalizations
                                            .of(context)
                                            .signUp),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(100.0))))),
                              ),
                            ],
                          )),
                    ],
                  )
              );
            }
        )
    );
  }
}
