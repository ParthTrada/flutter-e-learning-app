import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:e_learning_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('E-Learning App Integration Tests', () {
    testWidgets('should navigate through app flow', (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Wait for app to load
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify we're on the authentication screen
      expect(find.text('TrueNote'), findsOneWidget);
      expect(find.text('Log In with Linkedin'), findsOneWidget);

      // Test login button is present
      expect(find.text('Log In With Linkedin'), findsOneWidget);
    });

    testWidgets('should display app with dark theme', (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Verify dark theme is applied
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.themeMode, equals(ThemeMode.dark));
    });

    testWidgets('should handle app initialization', (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Verify app initializes without errors
      expect(find.byType(MaterialApp), findsOneWidget);
      
      // Verify no error dialogs are shown
      expect(find.byType(AlertDialog), findsNothing);
    });
  });
}
