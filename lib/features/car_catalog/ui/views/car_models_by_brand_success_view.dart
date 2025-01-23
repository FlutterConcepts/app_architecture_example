import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:flutter/material.dart';

class CarModelsByBrandSuccessView extends StatelessWidget {
  const CarModelsByBrandSuccessView({
    required this.carModels,
    super.key,
  });

  final List<CarSpecModel> carModels;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const Key('CarModelsByBrandSuccess'),
      padding: const EdgeInsets.all(16),
      itemCount: carModels.length,
      itemBuilder: (_, index) {
        final model = carModels[index];
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text('Código: ${model.code} | Modelo: ${model.name}'),
          ),
        );
      },
    );
  }
}
