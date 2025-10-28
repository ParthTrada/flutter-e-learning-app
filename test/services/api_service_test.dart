import 'package:flutter_test/flutter_test.dart';
import 'package:e_learning_app/core/services/api_services/api_services.dart';
import 'package:e_learning_app/core/services/api_services/api_end_points.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  group('API Service Tests', () {
    late ApiService apiService;
    late DioAdapter dioAdapter;

    setUp(() {
      apiService = ApiService();
      dioAdapter = DioAdapter();
    });

    tearDown(() {
      dioAdapter.close();
    });

    test('should make GET request successfully', () async {
      // Arrange
      const path = '/test-endpoint';
      const responseData = {'message': 'success'};
      
      dioAdapter.onGet(
        path,
        (server) => server.reply(200, responseData),
      );

      // Act
      final response = await apiService.get(path);

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, equals(responseData));
    });

    test('should make POST request successfully', () async {
      // Arrange
      const path = '/test-endpoint';
      const requestData = {'name': 'test'};
      const responseData = {'id': 1, 'name': 'test'};
      
      dioAdapter.onPost(
        path,
        (server) => server.reply(201, responseData),
        data: requestData,
      );

      // Act
      final response = await apiService.post(path, data: requestData);

      // Assert
      expect(response.statusCode, equals(201));
      expect(response.data, equals(responseData));
    });

    test('should handle API errors gracefully', () async {
      // Arrange
      const path = '/error-endpoint';
      
      dioAdapter.onGet(
        path,
        (server) => server.reply(500, {'error': 'Internal Server Error'}),
      );

      // Act & Assert
      expect(
        () => apiService.get(path),
        throwsA(isA<DioException>()),
      );
    });

    test('should make PUT request successfully', () async {
      // Arrange
      const path = '/test-endpoint';
      const requestData = {'name': 'updated'};
      const responseData = {'id': 1, 'name': 'updated'};
      
      dioAdapter.onPut(
        path,
        (server) => server.reply(200, responseData),
        data: requestData,
      );

      // Act
      final response = await apiService.put(path, data: requestData);

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, equals(responseData));
    });

    test('should make DELETE request successfully', () async {
      // Arrange
      const path = '/test-endpoint';
      
      dioAdapter.onDelete(
        path,
        (server) => server.reply(204, null),
      );

      // Act
      final response = await apiService.delete(path);

      // Assert
      expect(response.statusCode, equals(204));
    });
  });

  group('API Endpoints Tests', () {
    test('should generate correct expert list URL', () {
      // Arrange
      const page = 1;
      const limit = 10;

      // Act
      final url = ApiEndPoints.expertList(page, limit);

      // Assert
      expect(url, equals('https://parthtrada.obotoronika.com/experts?page=1&perPage=10'));
    });

    test('should generate correct expert detail URL', () {
      // Arrange
      const expertId = 'expert123';

      // Act
      final url = ApiEndPoints.expertDetail(expertId);

      // Assert
      expect(url, equals('https://parthtrada.obotoronika.com/experts/expert123'));
    });

    test('should generate correct messages URL', () {
      // Arrange
      const conversationId = 'conv123';
      const page = '1';
      const perPage = '20';

      // Act
      final url = ApiEndPoints.getMessages(conversationId, page, perPage);

      // Assert
      expect(url, equals('https://parthtrada.obotoronika.com/conversations/messages/conv123?page=1&perPage=20'));
    });

    test('should have correct base URL', () {
      // Assert
      expect(ApiEndPoints.baseUrl, equals('https://parthtrada.obotoronika.com'));
    });
  });
}
