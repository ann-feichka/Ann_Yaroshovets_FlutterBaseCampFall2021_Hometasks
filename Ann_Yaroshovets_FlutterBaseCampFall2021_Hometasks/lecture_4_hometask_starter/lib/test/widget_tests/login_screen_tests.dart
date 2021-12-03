import 'package:campnotes/screens/login_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

import '../../localization.dart';

void main(){

  Widget makeTestableWidget() {
    return MaterialApp(
      localizationsDelegates: [
        ArchSampleLocalizationsDelegate(),
        FlutterBlocLocalizationsDelegate(),
      ],
        home: LoginScreen(),
    );
  }

  testWidgets('Have inputs field for email and password',(WidgetTester tester) async{

    await tester.pumpWidget(makeTestableWidget());
    await tester.pumpAndSettle();

    final emailInputFinder = find.byKey(ArchSampleKeys.emailInput);
    final passwordInputFinder = find.byKey(ArchSampleKeys.passwordInput);

    expect(emailInputFinder,findsOneWidget);
    expect(passwordInputFinder,findsOneWidget);
  });

  testWidgets('Have button for login',(WidgetTester tester) async{

    await tester.pumpWidget(makeTestableWidget());
    await tester.pumpAndSettle();

    final loginButtonFinder = find.widgetWithText(ElevatedButton,"Login");

    expect(loginButtonFinder,findsOneWidget);
  });

  testWidgets('Have button for sign Up',(WidgetTester tester) async{

    await tester.pumpWidget(makeTestableWidget());
    await tester.pumpAndSettle();

    final signUpButtonFinder = find.widgetWithText(ElevatedButton,"Sign Up");

    expect(signUpButtonFinder,findsOneWidget);
  });


  testWidgets('Have text in fields when we enter it',(WidgetTester tester) async{
    final testEmail = "test@email.com";
    final testPassword = "123456";
    await tester.pumpWidget(makeTestableWidget());
    await tester.pumpAndSettle();


    final emailInputFinder = find.byKey(ArchSampleKeys.emailInput);
    await tester.enterText(emailInputFinder, testEmail);
    final emailFinder = find.text(testEmail);

    final passwordInputFinder = find.byKey(ArchSampleKeys.passwordInput);
    await tester.enterText(passwordInputFinder, testPassword);
    final passwordFinder = find.text(testPassword);

    expect(emailFinder,findsOneWidget);
    expect(passwordFinder,findsOneWidget);
  });

}

