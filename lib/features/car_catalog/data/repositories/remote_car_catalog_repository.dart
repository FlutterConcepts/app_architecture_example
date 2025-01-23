import 'package:app_architecture_example/app_architecture_example.dart';

class RemoteCarCatalogRepository implements CarCatalogRepository {
  RemoteCarCatalogRepository(this._service);

  final ParallelumCarCatalogService _service;

  @override
  Future<CarCatalogViewState> fetchCarBrands() async {
    final carBrandsResult = await _service.fetchCarBrands();
    return carBrandsResult.fold(
      CarBrandsSuccess.new,
      (error) => CarCatalogFailure(
        'Failed to fetch car brands catalog: $error',
      ), // Falha
    );
  }

  @override
  Future<CarCatalogViewState> fetchCarModelsByBrand(int brandId) async {
    final carModels = await _service.fetchCarModelsByBrand(brandId);

    return carModels.fold(
      CarModelsByBrandSuccess.new,
      (error) => CarCatalogFailure(
        'Failed to fetch car models catalog: $error',
      ), // Falha
    );
  }
}
