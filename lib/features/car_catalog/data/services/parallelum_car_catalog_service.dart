import 'dart:convert';

import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:http/http.dart';

class ParallelumCarCatalogService {
  ParallelumCarCatalogService(
    this._client, {
    required this.baseUrl,
  });

  final Client _client;
  final String baseUrl;

  Future<List<CarBrandModel>> fetchCarBrands() async {
    try {
      final response = await _client.get(Uri.parse('$baseUrl/cars/brands'));

      if (response.statusCode == 200) {
        final carBrands = (jsonDecode(response.body) as List<dynamic>)
            .cast<Map<String, dynamic>>()
            .map(CarBrandModel.fromJson)
            .toList();

        return carBrands;
      } else {
        throw Exception(
          'Failed to fetch car brands catalog. Status code: ${response.statusCode}',
        );
      }
    } catch (error) {
      throw Exception(
        'Failed to fetch car brands catalog: $error',
      );
    }
  }

  Future<List<CarSpecModel>> fetchCarModelsByBrand(int brandId) async {
    try {
      final response =
          await _client.get(Uri.parse('$baseUrl/cars/brands/$brandId/models'));

      if (response.statusCode == 200) {
        final carModels = (jsonDecode(response.body) as List<dynamic>)
            .cast<Map<String, dynamic>>()
            .map(CarSpecModel.fromJson)
            .toList();

        return carModels;
      } else {
        throw Exception(
          'Failed to fetch car models catalog. Status code: ${response.statusCode}',
        );
      }
    } catch (error) {
      throw Exception(
        'Failed to fetch car models catalog: $error',
      );
    }
  }
}
