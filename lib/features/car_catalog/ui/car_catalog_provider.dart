import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:flutter/widgets.dart';

class CarCatalogProvider extends InheritedNotifier<CarCatalogInteractor> {
  const CarCatalogProvider({
    required super.child,
    required CarCatalogInteractor interactor,
    super.key,
  }) : super(notifier: interactor);

  static CarCatalogInteractor of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<CarCatalogProvider>()!
          .notifier!;
    }
    return context
        .getInheritedWidgetOfExactType<CarCatalogProvider>()!
        .notifier!;
  }
}
