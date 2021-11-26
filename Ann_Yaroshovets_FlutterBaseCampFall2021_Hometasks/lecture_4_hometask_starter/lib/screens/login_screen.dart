import 'package:campnotes/data/shared_preferences_storage.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _error ="";
  bool password = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = Theme.of(context).primaryColor;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                ArchSampleLocalizations.of(context).login,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Form(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 15.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      // fillColor: kPrimaryColor.withOpacity(0.2),
                      // hintStyle: TextStyle(color: kPrimaryColor),
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
                    controller: _passwordController,
                    obscureText: password,
                    decoration: InputDecoration(
                        fillColor: borderColor,
                        // hintStyle: TextStyle(color: kPrimaryColor),
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
                Text(_error,style: TextStyle(
                  color:Theme.of(context).errorColor,
                  fontSize: 16,
                ),),
                ElevatedButton(
                    onPressed: () async {
                      await SharedPreferencesStorage.init();
                      if (_emailController.text.toString() ==
                              await SharedPreferencesStorage.getData("email") &&
                          _passwordController.text.toString() ==
                              await SharedPreferencesStorage.getData(
                                  "password")) {
                        Navigator.pushNamed(context, ArchSampleRoutes.home);
                      } else {
                        setErrorString();
                      }
                      // SharedPreferencesStorage.setBool("token", true);
                      // String email = await SharedPreferencesStorage.getData("email");
                      // print(email);
                      // Navigator.pushNamed(context, ArchSampleRoutes.home);
                    },
                    child: Text(ArchSampleLocalizations.of(context).login),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(100.0))))),
              ],
            )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, ArchSampleRoutes.registration);
                },
                child: Text("Dont have account"),
                style: ButtonStyle(
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(100.0))))),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
  void setErrorString(){
    setState(() {
      _error="Invalid login or password";
    });
  }
}
