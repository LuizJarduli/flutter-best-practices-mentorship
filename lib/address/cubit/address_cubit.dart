import 'package:equatable/equatable.dart';
import 'package:flutter_best_practices_bloc/address/model/address_model.dart';
import 'package:flutter_best_practices_bloc/address/use_case/get_cep_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(this._getCepUseCase) : super(AddressInitial());

  final GetCepUseCase _getCepUseCase;

  Future<void> getAddressFromPostalCode(String postalCode) async {
    emit(AddressInProgress());

    try {
      final response = await _getCepUseCase.execute(postalCode);

      emit(AddressSuccess(address: response!));
    } catch (ex) {
      print(ex);

      emit(AddressFailure());
    }
  }
}
