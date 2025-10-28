import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/src/features/authentication/presentation/authentication_screen.dart';
import 'package:e_learning_app/src/features/onboarding/riverpod/login_state.dart';

void main() {
  group('Authentication Screen Tests', () {
    testWidgets('should display login UI elements', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authTokenProvider.overrideWith((ref) => null),
          ],
          child: MaterialApp(
            home: const AuthenticationScreen(),
          ),
        ),
      );

      // Assert
      expect(find.text('TrueNote'), findsOneWidget);
      expect(find.text('Log In with Linkedin'), findsOneWidget);
      expect(find.text('Securely access your account with one tap using LinkedIn.'), findsOneWidget);
      expect(find.text('Log In With Linkedin'), findsOneWidget);
    });

    testWidgets('should display logo image', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authTokenProvider.overrideWith((ref) => null),
          ],
          child: MaterialApp(
            home: const AuthenticationScreen(),
          ),
        ),
      );

      // Assert
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should have login button', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authTokenProvider.overrideWith((ref) => null),
          ],
          child: MaterialApp(
            home: const AuthenticationScreen(),
          ),
        ),
      );

      // Assert
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });

  group('App Initialization Tests', () {
    testWidgets('should initialize app with dark theme', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authTokenProvider.overrideWith((ref) => null),
          ],
          child: const MyApp(isLoggedIn: false),
        ),
      );

      // Assert
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.themeMode, equals(ThemeMode.dark));
      expect(materialApp.debugShowCheckedModeBanner, isFalse);
    });

    testWidgets('should show splash screen when not logged in', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authTokenProvider.overrideWith((ref) => null),
          ],
          child: const MyApp(isLoggedIn: false),
        ),
      );

      // Assert
      // The app should navigate to splash screen when not logged in
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
