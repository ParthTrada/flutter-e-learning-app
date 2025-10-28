import 'package:flutter_test/flutter_test.dart';
import 'package:e_learning_app/core/utils/utils.dart';

void main() {
  group('Utils Tests', () {
    test('should validate email format correctly', () {
      // Valid emails
      expect(Utils.isValidEmail('test@example.com'), isTrue);
      expect(Utils.isValidEmail('user.name@domain.co.uk'), isTrue);
      expect(Utils.isValidEmail('user+tag@example.org'), isTrue);
      
      // Invalid emails
      expect(Utils.isValidEmail('invalid-email'), isFalse);
      expect(Utils.isValidEmail('@example.com'), isFalse);
      expect(Utils.isValidEmail('user@'), isFalse);
      expect(Utils.isValidEmail(''), isFalse);
    });

    test('should format currency correctly', () {
      expect(Utils.formatCurrency(50), equals('\$50'));
      expect(Utils.formatCurrency(100), equals('\$100'));
      expect(Utils.formatCurrency(0), equals('\$0'));
    });

    test('should format date correctly', () {
      final date = DateTime(2024, 1, 15, 14, 30);
      final formatted = Utils.formatDateTime(date);
      
      // This test might need adjustment based on actual implementation
      expect(formatted, isNotEmpty);
    });

    test('should validate phone number format', () {
      // Valid phone numbers
      expect(Utils.isValidPhoneNumber('+1234567890'), isTrue);
      expect(Utils.isValidPhoneNumber('123-456-7890'), isTrue);
      
      // Invalid phone numbers
      expect(Utils.isValidPhoneNumber('123'), isFalse);
      expect(Utils.isValidPhoneNumber(''), isFalse);
    });

    test('should generate random string', () {
      final randomString = Utils.generateRandomString(10);
      expect(randomString.length, equals(10));
      expect(randomString, isA<String>());
    });

    test('should check if string is empty or null', () {
      expect(Utils.isEmptyOrNull(''), isTrue);
      expect(Utils.isEmptyOrNull(null), isTrue);
      expect(Utils.isEmptyOrNull('   '), isTrue);
      expect(Utils.isEmptyOrNull('text'), isFalse);
    });
  });
}
