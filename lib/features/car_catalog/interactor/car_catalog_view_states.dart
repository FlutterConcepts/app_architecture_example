import 'package:app_architecture_example/app_architecture_example.dart';

sealed class CarCatalogViewState {}

final class CarCatalogLoading implements CarCatalogViewState {}

final class CarBrandsSuccess implements CarCatalogViewState {
  const CarBrandsSuccess(this.carBrands);

  final List<CarBrandEntity> carBrands;
}

final class CarModelsByBrandSuccess implements CarCatalogViewState {
  const CarModelsByBrandSuccess(this.carModels);

  final List<CarModelEntity> carModels;
}

final class CarCatalogFailure implements CarCatalogViewState {
  const CarCatalogFailure(this.message);

  final String message;
}
