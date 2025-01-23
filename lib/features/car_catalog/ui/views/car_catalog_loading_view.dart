import 'package:flutter/material.dart';

class CarCatalogLoadingView extends StatelessWidget {
  const CarCatalogLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      key: Key('CarCatalogLoading'),
      child: CircularProgressIndicator(),
    );
  }
}
