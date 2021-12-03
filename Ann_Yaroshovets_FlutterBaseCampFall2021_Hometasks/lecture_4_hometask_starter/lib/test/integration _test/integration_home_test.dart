import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:campnotes/main.dart' as app;
import 'package:todos_app_core/todos_app_core.dart';


void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Transition to Add TODO screen',(WidgetTester tester) async{
    app.main();
    await tester.pumpAndSettle();

    final FABFinder = find.byIcon(Icons.add);

    await tester.tap(FABFinder);

    await tester.pumpAndSettle();

    final AppBarFinder = find.byKey(ArchSampleKeys.noteField);

    expect(AppBarFinder,findsOneWidget);
  });

}