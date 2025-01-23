import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:flutter/material.dart';

class CarCatalogPage extends StatefulWidget {
  const CarCatalogPage({super.key});

  @override
  State<CarCatalogPage> createState() => _CarCatalogPageState();
}

class _CarCatalogPageState extends State<CarCatalogPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await CarCatalogProvider.of(context, listen: false).fetchCarBrands();
    });
  }

  @override
  Widget build(BuildContext context) {
    final interactor = CarCatalogProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(Constants.appName),
      ),
      body: switch (interactor.value) {
        CarCatalogLoading() => const CarCatalogLoadingView(),
        CarBrandsSuccess(carBrands: final List<CarBrandEntity> carBrands) =>
          CarBrandsSuccessView(carBrands: carBrands),
        CarModelsByBrandSuccess(
          carModels: final List<CarModelEntity> carModels
        ) =>
          CarModelsByBrandSuccessView(carModels: carModels),
        CarCatalogFailure(message: final String message) =>
          CarCatalogFailureView(message: message),
      },
      floatingActionButton: FloatingActionButton(
        onPressed: interactor.fetchCarBrands,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
