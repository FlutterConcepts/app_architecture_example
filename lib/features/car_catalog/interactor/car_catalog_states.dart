import 'package:app_architecture_example/app_architecture_example.dart';

sealed class CarCatalogState {}

final class CarCatalogLoading implements CarCatalogState {}

final class CarBrandsSuccess implements CarCatalogState {
  const CarBrandsSuccess(this.carBrands);

  final List<CarBrandEntity> carBrands;
}

final class CarModelsByBrandSuccess implements CarCatalogState {
  const CarModelsByBrandSuccess(this.carModels);

  final List<CarModelEntity> carModels;
}

final class CarCatalogFailure implements CarCatalogState {
  const CarCatalogFailure(this.message);

  final String message;
}
