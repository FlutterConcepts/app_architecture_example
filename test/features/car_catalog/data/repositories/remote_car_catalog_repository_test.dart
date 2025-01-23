import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

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
          .thenAnswer((_) async => Success(mockCarBrands));

      // Act
      final result = await sut.fetchCarBrands();

      // Assert
      expect(result, isA<CarBrandsSuccess>());
      final successState = result as CarBrandsSuccess;
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
      final result = await sut.fetchCarBrands();

      // Assert
      expect(result, isA<CarCatalogFailure>());
      final failureState = result as CarCatalogFailure;
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
        return CarSpecModel(
          code: faker.randomGenerator.integer(1000, min: 1),
          name: faker.vehicle.model(),
        );
      });
      when(() => mockService.fetchCarModelsByBrand(brandId))
          .thenAnswer((_) async => Success(mockCarModels));

      // Act
      final result = await sut.fetchCarModelsByBrand(brandId);

      // Assert
      expect(result, isA<CarModelsByBrandSuccess>());
      final successState = result as CarModelsByBrandSuccess;
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
      final result = await sut.fetchCarModelsByBrand(brandId);

      // Assert
      expect(result, isA<CarCatalogFailure>());
      final failureState = result as CarCatalogFailure;
      expect(
        failureState.message,
        'Failed to fetch car models catalog: $mockException',
      );
      verify(() => mockService.fetchCarModelsByBrand(brandId)).called(1);
    });
  });
}
