import 'package:app_architecture_example/app_architecture_example.dart';

abstract interface class CarCatalogRepository {
  Future<CarCatalogViewState> fetchCarBrands();
  Future<CarCatalogViewState> fetchCarModelsByBrand(int brandId);
}
