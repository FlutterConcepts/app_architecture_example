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
    late String baseUrl;
    late ParallelumCarCatalogService sut;

    setUp(() {
      mockClient = MockClient();
      baseUrl = faker.internet.httpsUrl();
      sut = ParallelumCarCatalogService(mockClient, baseUrl: baseUrl);
    });

    setUpAll(() {
      registerFallbackValue(Uri.parse(''));
    });

    test(
        'Should fetch car brands and return a success Result with a list of CarBrandModel',
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
      final result = await sut.fetchCarBrands();

      // Assert
      expect(result.isSuccess(), isTrue);
      result.onSuccess(
        (data) {
          expect(data, isA<List<CarBrandEntity>>());
          expect(data.length, 5);
        },
      ).onFailure(
        (_) => fail('Expected success but got failure'),
      );
      verify(() => mockClient.get(any())).called(1);
    });

    test(
        'Should return a failure Result when API call for car brands fails with non-200 status',
        () async {
      // Arrange
      const mockStatusCode = 404;
      when(() => mockClient.get(any()))
          .thenAnswer((_) async => Response('', mockStatusCode));

      // Act
      final result = await sut.fetchCarBrands();

      // Assert
      expect(result.isError(), isTrue);
      result
          .onSuccess(
            (_) => fail('Expected failure but got success'),
          )
          .onFailure(
            (error) => expect(error, isA<Exception>()),
          );
      verify(() => mockClient.get(any())).called(1);
    });

    test(
        'Should fetch car models by brand and return a success Result with a list of CarSpecModel',
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
      final result = await sut.fetchCarModelsByBrand(brandId);

      // Assert
      expect(result.isSuccess(), isTrue);
      result.onSuccess((data) {
        expect(data, isA<List<CarModelEntity>>());
        expect(data.length, 5);
      }).onFailure(
        (_) => fail('Expected success but got failure'),
      );
      verify(
        () => mockClient.get(Uri.parse('$baseUrl/cars/brands/$brandId/models')),
      ).called(1);
    });

    test(
        'Should return a failure Result when API call for car models fails with non-200 status',
        () async {
      // Arrange
      const brandId = 1;
      const mockStatusCode = 404;
      when(
        () => mockClient.get(Uri.parse('$baseUrl/cars/brands/$brandId/models')),
      ).thenAnswer((_) async => Response('', mockStatusCode));

      // Act
      final result = await sut.fetchCarModelsByBrand(brandId);

      // Assert
      expect(result.isError(), isTrue);
      result
          .onSuccess((_) => fail('Expected failure but got success'))
          .onFailure((error) => expect(error, isA<Exception>()));
      verify(
        () => mockClient.get(Uri.parse('$baseUrl/cars/brands/$brandId/models')),
      ).called(1);
    });
  });
}
