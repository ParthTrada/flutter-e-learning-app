import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/src/features/onboarding/riverpod/login_state.dart';

void main() {
  group('App Widget Tests', () {
    testWidgets('should initialize app without errors', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authTokenProvider.overrideWith((ref) => null),
          ],
          child: const MyApp(isLoggedIn: false),
        ),
      );

      // Verify that the app initializes
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('should display dark theme', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authTokenProvider.overrideWith((ref) => null),
          ],
          child: const MyApp(isLoggedIn: false),
        ),
      );

      // Verify dark theme is applied
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.themeMode, equals(ThemeMode.dark));
      expect(materialApp.debugShowCheckedModeBanner, isFalse);
    });

    testWidgets('should handle logged in state', (WidgetTester tester) async {
      // Build our app with logged in state
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authTokenProvider.overrideWith((ref) => 'test_token'),
          ],
          child: const MyApp(isLoggedIn: true),
        ),
      );

      // Verify that the app initializes
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
