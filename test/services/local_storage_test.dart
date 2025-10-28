import 'package:flutter_test/flutter_test.dart';
import 'package:e_learning_app/core/services/local_storage_services/local_storage_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('Local Storage Service Tests', () {
    late LocalStorageServices localStorageServices;

    setUp(() async {
      // Initialize SharedPreferences with empty data for testing
      SharedPreferences.setMockInitialValues({});
      localStorageServices = LocalStorageServices();
    });

    test('should store and retrieve string value', () async {
      // Arrange
      const key = 'test_key';
      const value = 'test_value';

      // Act
      await localStorageServices.setString(key, value);
      final retrievedValue = await localStorageServices.getString(key);

      // Assert
      expect(retrievedValue, equals(value));
    });

    test('should store and retrieve integer value', () async {
      // Arrange
      const key = 'test_int_key';
      const value = 42;

      // Act
      await localStorageServices.setInt(key, value);
      final retrievedValue = await localStorageServices.getInt(key);

      // Assert
      expect(retrievedValue, equals(value));
    });

    test('should store and retrieve boolean value', () async {
      // Arrange
      const key = 'test_bool_key';
      const value = true;

      // Act
      await localStorageServices.setBool(key, value);
      final retrievedValue = await localStorageServices.getBool(key);

      // Assert
      expect(retrievedValue, equals(value));
    });

    test('should return null for non-existent key', () async {
      // Arrange
      const key = 'non_existent_key';

      // Act
      final retrievedValue = await localStorageServices.getString(key);

      // Assert
      expect(retrievedValue, isNull);
    });

    test('should remove stored value', () async {
      // Arrange
      const key = 'test_remove_key';
      const value = 'test_value';
      await localStorageServices.setString(key, value);

      // Act
      await localStorageServices.remove(key);
      final retrievedValue = await localStorageServices.getString(key);

      // Assert
      expect(retrievedValue, isNull);
    });

    test('should clear all stored values', () async {
      // Arrange
      await localStorageServices.setString('key1', 'value1');
      await localStorageServices.setString('key2', 'value2');

      // Act
      await localStorageServices.clear();

      // Assert
      expect(await localStorageServices.getString('key1'), isNull);
      expect(await localStorageServices.getString('key2'), isNull);
    });
  });
}
