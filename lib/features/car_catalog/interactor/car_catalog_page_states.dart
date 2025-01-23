import 'package:app_architecture_example/app_architecture_example.dart';

sealed class CarCatalogPageState {}

final class CarCatalogLoading implements CarCatalogPageState {}

final class CarBrandsSuccess implements CarCatalogPageState {
  const CarBrandsSuccess(this.carBrands);

  final List<CarBrandModel> carBrands;
}

final class CarModelsByBrandSuccess implements CarCatalogPageState {
  const CarModelsByBrandSuccess(this.carModels);

  final List<CarSpecModel> carModels;
}

final class CarCatalogFailure implements CarCatalogPageState {
  const CarCatalogFailure(this.message);

  final String message;
}
