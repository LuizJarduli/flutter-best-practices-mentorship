import 'package:flutter_best_practices_bloc/address/address.dart';
import 'package:flutter_best_practices_bloc/address/repository/address_repository.dart';
import 'package:flutter_best_practices_bloc/core/http_client/http_client.dart';

class AddressRepositoryViacepImpl implements AddressRepository {
  const AddressRepositoryViacepImpl(this._httpClient);

  final HttpClient _httpClient;

  static const String url = 'https://viacep.com.br/ws/';

  @override
  Future<Address?> getFromCache(String postalCode) {
    // TODO: implement getFromCache
    throw UnimplementedError();
  }

  @override
  Future<Address?> getFromPostalCode(String postalCode) async {
    try {
      final response = await _httpClient.get<Map<String, Object?>>(
        '$url/$postalCode/json',
      );

      return AddressResponseDTO.fromJson(response.body).toAddress();
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> storeInCache(Address address) {
    // TODO: implement storeInCache
    throw UnimplementedError();
  }

  @override
  Future<bool> hasInCache(String postalCode) {
    // TODO: implement hasInCache
    throw UnimplementedError();
  }
}
