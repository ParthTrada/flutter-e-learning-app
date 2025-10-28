import 'package:flutter_test/flutter_test.dart';
import 'package:e_learning_app/src/features/profile/data/models/user_profile.dart';

void main() {
  group('UserProfile Model Tests', () {
    test('should create UserProfile from valid JSON', () {
      // Arrange
      final json = {
        'name': 'John Doe',
        'university': 'MIT',
        'profession': 'Software Engineer',
        'organization': 'Google',
        'location': 'San Francisco',
        'description': 'Experienced developer',
        'experience': '5 years',
        'hourlyRate': 50,
        'skills': ['Flutter', 'Dart', 'Firebase'],
        'availableDays': ['Monday', 'Tuesday', 'Wednesday'],
        'availableTime': ['09:00', '10:00', '11:00'],
      };

      // Act
      final userProfile = UserProfile.fromJson(json);

      // Assert
      expect(userProfile.name, equals('John Doe'));
      expect(userProfile.university, equals('MIT'));
      expect(userProfile.profession, equals('Software Engineer'));
      expect(userProfile.organization, equals('Google'));
      expect(userProfile.location, equals('San Francisco'));
      expect(userProfile.description, equals('Experienced developer'));
      expect(userProfile.experience, equals('5 years'));
      expect(userProfile.hourlyRate, equals(50));
      expect(userProfile.skills, equals(['Flutter', 'Dart', 'Firebase']));
      expect(userProfile.availableDays, equals(['Monday', 'Tuesday', 'Wednesday']));
      expect(userProfile.availableTime, equals(['09:00', '10:00', '11:00']));
    });

    test('should handle null values in JSON', () {
      // Arrange
      final json = <String, dynamic>{};

      // Act
      final userProfile = UserProfile.fromJson(json);

      // Assert
      expect(userProfile.name, isNull);
      expect(userProfile.university, isNull);
      expect(userProfile.profession, isNull);
      expect(userProfile.organization, isNull);
      expect(userProfile.location, isNull);
      expect(userProfile.description, isNull);
      expect(userProfile.experience, isNull);
      expect(userProfile.hourlyRate, isNull);
      expect(userProfile.skills, isNull);
      expect(userProfile.availableDays, isNull);
      expect(userProfile.availableTime, isNull);
    });

    test('should convert UserProfile to JSON correctly', () {
      // Arrange
      final userProfile = UserProfile(
        name: 'Jane Smith',
        university: 'Stanford',
        profession: 'Data Scientist',
        organization: 'Microsoft',
        location: 'Seattle',
        description: 'AI/ML expert',
        experience: '3 years',
        hourlyRate: 75,
        skills: ['Python', 'TensorFlow', 'PyTorch'],
        availableDays: ['Thursday', 'Friday'],
        availableTime: ['14:00', '15:00'],
      );

      // Act
      final json = userProfile.toJson();

      // Assert
      expect(json['name'], equals('Jane Smith'));
      expect(json['university'], equals('Stanford'));
      expect(json['profession'], equals('Data Scientist'));
      expect(json['organization'], equals('Microsoft'));
      expect(json['location'], equals('Seattle'));
      expect(json['description'], equals('AI/ML expert'));
      expect(json['experience'], equals('3 years'));
      expect(json['hourlyRate'], equals(75));
      expect(json['skills'], equals(['Python', 'TensorFlow', 'PyTorch']));
      expect(json['availableDays'], equals(['Thursday', 'Friday']));
      expect(json['availableTime'], equals(['14:00', '15:00']));
    });

    test('should handle partial data in toJson', () {
      // Arrange
      final userProfile = UserProfile(
        name: 'Test User',
        hourlyRate: 30,
      );

      // Act
      final json = userProfile.toJson();

      // Assert
      expect(json['name'], equals('Test User'));
      expect(json['hourlyRate'], equals(30));
      expect(json.containsKey('university'), isFalse);
      expect(json.containsKey('skills'), isFalse);
    });
  });
}
