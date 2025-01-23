import 'package:flutter/material.dart';

class CarCatalogFailureView extends StatelessWidget {
  const CarCatalogFailureView({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      key: const Key('CarCatalogFailure'),
      child: Text(message),
    );
  }
}
