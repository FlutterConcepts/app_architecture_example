import 'dart:convert';

import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements Client {}

class MockParallelumCarCatalogService extends Mock
    implements ParallelumCarCatalogService {}

void main() {
  late MockParallelumCarCatalogService mockService;
  late RemoteCarCatalogRepository sut;

  setUp(() {
    mockService = MockParallelumCarCatalogService();
    sut = RemoteCarCatalogRepository(mockService);
  });

  setUpAll(() {
    registerFallbackValue(Uri.parse(''));
  });

  group('RemoteCarCatalogRepository.fetchCarBrands Tests |', () {
    test(
        'Should return CarBrandsSuccess when service fetchCarBrands succeeds with valid data',
        () async {
      // Arrange
      final mockCarBrands = List.generate(5, (_) {
        return CarBrandModel(
          code: faker.randomGenerator.integer(1000, min: 1),
          name: faker.vehicle.model(),
        );
      });
      when(() => mockService.fetchCarBrands())
          .thenAnswer((_) async => mockCarBrands);

      // Act
      final result = await sut.fetchCarBrands();

      // Assert
      expect(result, isA<CarBrandsSuccess>());
      final successState = result as CarBrandsSuccess;
      expect(successState.carBrands, mockCarBrands);
      verify(() => mockService.fetchCarBrands()).called(1);
    });

    test('Should return CarCatalogFailure when service throws an exception',
        () async {
      // Arrange
      final mockExceptionMessage = faker.lorem.sentence();
      when(() => mockService.fetchCarBrands())
          .thenThrow(Exception(mockExceptionMessage));

      // Act
      final result = await sut.fetchCarBrands();

      // Assert
      expect(result, isA<CarCatalogFailure>());
      final failureState = result as CarCatalogFailure;
      expect(
        failureState.message,
        'Failed to fetch car brands catalog: Exception: $mockExceptionMessage',
      );
      verify(() => mockService.fetchCarBrands()).called(1);
    });
  });

  group('RemoteCarCatalogRepository.fetchCarModelsByBrand Tests |', () {
    test(
        'Should return CarModelsByBrandSuccess when service fetchCarModelsByBrand succeeds with valid data',
        () async {
      // Arrange
      const brandId = 1;
      final mockCarModels = List.generate(5, (_) {
        return CarSpecModel(
          code: faker.randomGenerator.integer(1000, min: 1),
          name: faker.vehicle.model(),
        );
      });
      when(() => mockService.fetchCarModelsByBrand(brandId))
          .thenAnswer((_) async => mockCarModels);

      // Act
      final result = await sut.fetchCarModelsByBrand(brandId);

      // Assert
      expect(result, isA<CarModelsByBrandSuccess>());
      final successState = result as CarModelsByBrandSuccess;
      expect(successState.carModels, mockCarModels);
      verify(() => mockService.fetchCarModelsByBrand(brandId)).called(1);
    });

    test('Should return CarCatalogFailure when service throws an exception',
        () async {
      // Arrange
      const brandId = 1;
      final mockExceptionMessage = faker.lorem.sentence();
      when(() => mockService.fetchCarModelsByBrand(brandId))
          .thenThrow(Exception(mockExceptionMessage));

      // Act
      final result = await sut.fetchCarModelsByBrand(brandId);

      // Assert
      expect(result, isA<CarCatalogFailure>());
      final failureState = result as CarCatalogFailure;
      expect(
        failureState.message,
        'Failed to fetch car models catalog: Exception: $mockExceptionMessage',
      );
      verify(() => mockService.fetchCarModelsByBrand(brandId)).called(1);
    });
  });

  group('ParallelumCarCatalogService Tests |', () {
    late MockClient mockClient;
    late ParallelumCarCatalogService service;
    late String baseUrl;

    setUp(() {
      mockClient = MockClient();
      baseUrl = faker.internet.httpsUrl();
      service = ParallelumCarCatalogService(mockClient, baseUrl: baseUrl);
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
