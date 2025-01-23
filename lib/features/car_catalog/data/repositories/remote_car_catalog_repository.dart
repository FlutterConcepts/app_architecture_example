import 'package:app_architecture_example/app_architecture_example.dart';

class RemoteCarCatalogRepository implements CarCatalogRepository {
  RemoteCarCatalogRepository(this._service);

  final ParallelumCarCatalogService _service;

  @override
  Future<CarCatalogViewState> fetchCarBrands() async {
    try {
      final carBrands = await _service.fetchCarBrands();

      return CarBrandsSuccess(carBrands);
    } catch (error) {
      return CarCatalogFailure(
        'Failed to fetch car brands catalog: $error',
      );
    }
  }

  @override
  Future<CarCatalogViewState> fetchCarModelsByBrand(int brandId) async {
    try {
      final carModels = await _service.fetchCarModelsByBrand(brandId);

      return CarModelsByBrandSuccess(carModels);
    } catch (error) {
      return CarCatalogFailure(
        'Failed to fetch car models catalog: $error',
      );
    }
  }
}
