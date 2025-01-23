import 'dart:convert';

import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:http/http.dart';
import 'package:result_dart/result_dart.dart';

class ParallelumCarCatalogService {
  ParallelumCarCatalogService(
    this._client, {
    required this.baseUrl,
  });

  final Client _client;
  final String baseUrl;

  AsyncResult<List<CarBrandEntity>> fetchCarBrands() async {
    try {
      final response = await _client.get(Uri.parse('$baseUrl/cars/brands'));

      if (response.statusCode == 200) {
        final carBrands = (jsonDecode(response.body) as List<dynamic>)
            .cast<Map<String, dynamic>>()
            .map(CarBrandEntity.fromJson)
            .toList();

        return Success(carBrands);
      } else {
        return Failure(
          Exception(
            'Failed to fetch car brands catalog. Status code: ${response.statusCode}',
          ),
        );
      }
    } catch (error) {
      return Failure(
        Exception(
          'Failed to fetch car brands catalog. Error: $error',
        ),
      );
    }
  }

  AsyncResult<List<CarModelEntity>> fetchCarModelsByBrand(
    int brandId,
  ) async {
    try {
      final response =
          await _client.get(Uri.parse('$baseUrl/cars/brands/$brandId/models'));

      if (response.statusCode == 200) {
        final carModels = (jsonDecode(response.body) as List<dynamic>)
            .cast<Map<String, dynamic>>()
            .map(CarModelEntity.fromJson)
            .toList();

        return Success(carModels);
      } else {
        return Failure(
          Exception(
            'Failed to fetch car models catalog. Status code: ${response.statusCode}',
          ),
        );
      }
    } catch (error) {
      return Failure(
        Exception(
          'Failed to fetch car models catalog. Error: $error',
        ),
      );
    }
  }
}
