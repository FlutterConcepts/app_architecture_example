import 'package:app_architecture_example/app_architecture_example.dart';

abstract interface class CarCatalogRepository {
  Future<CarCatalogPageState> fetchCarBrands();
  Future<CarCatalogPageState> fetchCarModelsByBrand(int brandId);
}
