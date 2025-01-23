import 'package:app_architecture_example/app_architecture_example.dart';

abstract interface class CarCatalogRepository {
  Future<CarCatalogState> fetchCarBrands();
  Future<CarCatalogState> fetchCarModelsByBrand(int brandId);
}
