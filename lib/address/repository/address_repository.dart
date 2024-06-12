import 'package:flutter_best_practices_bloc/address/address.dart';

abstract interface class AddressRepository {
  Future<Address?> getFromPostalCode(String postalCode);

  Future<void> storeInCache(Address address);

  Future<Address?> getFromCache(String postalCode);

  Future<bool> hasInCache(String postalCode);
}
