import 'package:flutter_best_practices_bloc/address/model/address_model.dart';

abstract interface class GetCepUseCase {
  Future<Address?> execute(String postalCode);
}
