import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      initialRoute: CarCatalogScreen.initialRoute,
      routes: {
        CarCatalogScreen.initialRoute: (_) => const CarCatalogScreen(),
      },
    );
  }
}
