import 'package:app_architecture_example/app_architecture_example.dart';

class RemoteCarCatalogRepository implements CarCatalogRepository {
  RemoteCarCatalogRepository(this._service);

  final ParallelumCarCatalogService _service;

  @override
  Future<CarCatalogState> fetchCarBrands() async {
    final result = await _service.fetchCarBrands();
    return result.fold(
      CarBrandsSuccess.new,
      (error) => CarCatalogFailure(
        'Failed to fetch car brands catalog: $error',
      ), // Falha
    );
  }

  @override
  Future<CarCatalogState> fetchCarModelsByBrand(int brandId) async {
    final result = await _service.fetchCarModelsByBrand(brandId);
    return result.fold(
      CarModelsByBrandSuccess.new,
      (error) => CarCatalogFailure(
        'Failed to fetch car models catalog: $error',
      ), // Falha
    );
  }
}
