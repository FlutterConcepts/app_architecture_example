import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class CarCatalogModule extends StatelessWidget {
  const CarCatalogModule({super.key});

  static const initialRoute = '/carCatalog';

  @override
  Widget build(BuildContext context) {
    final client = Client();
    final repository =
        ParallelumCarCatalogRepository(client, baseUrl: Constants.baseUrl);
    final interactor = CarCatalogInteractor(repository);

    return CarCatalogProvider(
      interactor: interactor,
      child: const CarCatalogPage(),
    );
  }
}
