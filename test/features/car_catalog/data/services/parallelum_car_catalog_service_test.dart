import 'dart:convert';

import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements Client {}

void main() {
  group('ParallelumCarCatalogService Tests |', () {
    late MockClient mockClient;
    late ParallelumCarCatalogService service;
    late String baseUrl;

    setUp(() {
      mockClient = MockClient();
      baseUrl = faker.internet.httpsUrl();
      service = ParallelumCarCatalogService(mockClient, baseUrl: baseUrl);
    });

    setUpAll(() {
      registerFallbackValue(Uri.parse(''));
    });

    test(
        'Should fetch car brands and return a list of CarBrandModel on success',
        () async {
      // Arrange
      final mockResponseData = jsonEncode(
        List.generate(5, (_) {
          return {
            'code': faker.randomGenerator.integer(1000, min: 1).toString(),
            'name': faker.vehicle.model(),
          };
        }),
      );

      when(() => mockClient.get(any()))
          .thenAnswer((_) async => Response(mockResponseData, 200));

      // Act
      final result = await service.fetchCarBrands();

      // Assert
      expect(result, isA<List<CarBrandModel>>());
      expect(result.length, 5);
      verify(() => mockClient.get(any())).called(1);
    });

    test('Should throw an exception when API call fails', () async {
      // Arrange
      const mockStatusCode = 404;
      when(() => mockClient.get(any()))
          .thenAnswer((_) async => Response('', mockStatusCode));

      // Act & Assert
      expect(
        () async => service.fetchCarBrands(),
        throwsA(isA<Exception>()),
      );
      verify(() => mockClient.get(any())).called(1);
    });

    test('Should fetch car models by brand and return a list of CarSpecModel',
        () async {
      // Arrange
      const brandId = 1;
      final mockResponseData = jsonEncode(
        List.generate(5, (_) {
          return {
            'code': faker.randomGenerator.integer(1000, min: 1).toString(),
            'name': faker.vehicle.model(),
          };
        }),
      );
      when(
        () => mockClient.get(Uri.parse('$baseUrl/cars/brands/$brandId/models')),
      ).thenAnswer((_) async => Response(mockResponseData, 200));

      // Act
      final result = await service.fetchCarModelsByBrand(brandId);

      // Assert
      expect(result, isA<List<CarSpecModel>>());
      expect(result.length, 5);
      verify(
        () => mockClient.get(Uri.parse('$baseUrl/cars/brands/$brandId/models')),
      ).called(1);
    });

    test('Should throw an exception when API call for car models fails',
        () async {
      // Arrange
      const brandId = 1;
      const mockStatusCode = 404;
      when(
        () => mockClient.get(Uri.parse('$baseUrl/cars/brands/$brandId/models')),
      ).thenAnswer((_) async => Response('', mockStatusCode));

      // Act & Assert
      expect(
        () async => service.fetchCarModelsByBrand(brandId),
        throwsA(isA<Exception>()),
      );
      verify(
        () => mockClient.get(Uri.parse('$baseUrl/cars/brands/$brandId/models')),
      ).called(1);
    });
  });
}
