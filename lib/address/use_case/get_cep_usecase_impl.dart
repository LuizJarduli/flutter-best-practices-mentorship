import 'package:flutter_best_practices_bloc/address/model/address_model.dart';
import 'package:flutter_best_practices_bloc/address/repository/address_repository.dart';
import 'package:flutter_best_practices_bloc/address/use_case/get_cep_usecase.dart';

class GetCepUseCaseImpl implements GetCepUseCase {
  const GetCepUseCaseImpl(this._addressRepository);

  final AddressRepository _addressRepository;

  @override
  Future<Address?> execute(String postalCode) async {
    return _addressRepository.getFromPostalCode(postalCode);

    // final hasInCache = await _addressRepository.hasInCache(postalCode);

    // final response = hasInCache
    //     ? await _addressRepository.getFromCache(postalCode)
    //     : await _addressRepository.getFromPostalCode(postalCode);

    // await _addressRepository.storeInCache(response!);

    // return response;
  }
}
