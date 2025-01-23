import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class CarCatalogScreen extends StatelessWidget {
  const CarCatalogScreen({super.key});

  static const initialRoute = '/carCatalog';

  @override
  Widget build(BuildContext context) {
    final client = Client();
    final service = ParallelumCarCatalogService(
      client,
      baseUrl: Constants.parallelumV2BaseUrl,
    );
    final repository = RemoteCarCatalogRepository(service);
    final interactor = CarCatalogInteractor(repository);

    return CarCatalogProvider(
      interactor: interactor,
      child: const CarCatalogPage(),
    );
  }
}
