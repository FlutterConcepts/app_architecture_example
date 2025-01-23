import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:flutter/material.dart';

class CarBrandsSuccessView extends StatelessWidget {
  const CarBrandsSuccessView({
    required this.carBrands,
    super.key,
  });

  final List<CarBrandModel> carBrands;

  @override
  Widget build(BuildContext context) {
    final interactor = CarCatalogProvider.of(context);

    return ListView.builder(
      key: const Key('CarBrandsSuccess'),
      padding: const EdgeInsets.all(16),
      itemCount: carBrands.length,
      itemBuilder: (_, index) {
        final brand = carBrands[index];
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              onPressed: () => interactor.fetchCarModelsByBrand(brand.code),
              child: Text('Código: ${brand.code} | Marca: ${brand.name}'),
            ),
          ),
        );
      },
    );
  }
}
