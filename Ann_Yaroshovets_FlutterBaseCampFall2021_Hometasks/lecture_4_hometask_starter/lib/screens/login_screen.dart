import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';
import '../data/network/fire_auth.dart';
import '../validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool password = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = Theme
        .of(context)
        .primaryColor;
    return Scaffold(
      body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: Text(
                        ArchSampleLocalizations
                            .of(context)
                            .login,
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
                                controller: _emailController,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(fontSize: 18.0),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.0)),
                                  ),
                                  labelText: ArchSampleLocalizations
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
                                    Validator.validatePassword(password: value),
                                controller: _passwordController,
                                obscureText: password,
                                decoration: InputDecoration(
                                    fillColor: borderColor,
                                    labelStyle: TextStyle(fontSize: 18.0),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(100.0)),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget> [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          await FireAuth
                                              .signInUsingEmailPassword(
                                              email: _emailController.text,
                                              password: _passwordController.text
                                          );
                                          Navigator.pushReplacementNamed(
                                              context, ArchSampleRoutes.home);
                                        }
                                      },
                                      child: Text(ArchSampleLocalizations
                                          .of(context)
                                          .login),
                                      style: ButtonStyle(
                                          shape:
                                          MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(100.0))))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, ArchSampleRoutes.registration);
                                      },
                                      child: Text("Sign Up"),
                                      style: ButtonStyle(
                                          shape:
                                          MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(100.0))))),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              )
    );
  }
}
