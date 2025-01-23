import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

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
        return CarBrandEntity(
          code: faker.randomGenerator.integer(1000, min: 1),
          name: faker.vehicle.model(),
        );
      });
      when(() => mockService.fetchCarBrands())
          .thenAnswer((_) async => Success(mockCarBrands));

      // Act
      final newState = await sut.fetchCarBrands();

      // Assert
      expect(newState, isA<CarBrandsSuccess>());
      final successState = newState as CarBrandsSuccess;
      expect(successState.carBrands, mockCarBrands);
      verify(() => mockService.fetchCarBrands()).called(1);
    });

    test('Should return CarCatalogFailure when service fetchCarBrands fails',
        () async {
      // Arrange
      final mockException = Exception(faker.lorem.sentence());
      when(() => mockService.fetchCarBrands())
          .thenAnswer((_) async => Failure(mockException));

      // Act
      final newState = await sut.fetchCarBrands();

      // Assert
      expect(newState, isA<CarCatalogFailure>());
      final failureState = newState as CarCatalogFailure;
      expect(
        failureState.message,
        'Failed to fetch car brands catalog: $mockException',
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
        return CarModelEntity(
          code: faker.randomGenerator.integer(1000, min: 1),
          name: faker.vehicle.model(),
        );
      });
      when(() => mockService.fetchCarModelsByBrand(brandId))
          .thenAnswer((_) async => Success(mockCarModels));

      // Act
      final newState = await sut.fetchCarModelsByBrand(brandId);

      // Assert
      expect(newState, isA<CarModelsByBrandSuccess>());
      final successState = newState as CarModelsByBrandSuccess;
      expect(successState.carModels, mockCarModels);
      verify(() => mockService.fetchCarModelsByBrand(brandId)).called(1);
    });

    test(
        'Should return CarCatalogFailure when service fetchCarModelsByBrand fails',
        () async {
      // Arrange
      const brandId = 1;
      final mockException = Exception(faker.lorem.sentence());
      when(() => mockService.fetchCarModelsByBrand(brandId))
          .thenAnswer((_) async => Failure(mockException));

      // Act
      final newState = await sut.fetchCarModelsByBrand(brandId);

      // Assert
      expect(newState, isA<CarCatalogFailure>());
      final failureState = newState as CarCatalogFailure;
      expect(
        failureState.message,
        'Failed to fetch car models catalog: $mockException',
      );
      verify(() => mockService.fetchCarModelsByBrand(brandId)).called(1);
    });
  });
}
