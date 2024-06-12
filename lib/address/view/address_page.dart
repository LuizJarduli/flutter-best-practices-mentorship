import 'package:flutter/material.dart';
import 'package:flutter_best_practices_bloc/address/cubit/address_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  void initState() {
    super.initState();
    context.read<AddressCubit>().getAddressFromPostalCode('60530320');
  }

  void _handleInitial(AddressState state) {}

  void _handleInProgress() {}

  void _handleSuccess() {}

  void _handleFailure() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Endereço Finder'),
      ),
      body: Center(
        child: BlocConsumer<AddressCubit, AddressState>(
          listener: (context, state) {
            final handler = switch (state) {
              AddressInitial() => () => _handleInitial(state),
              AddressInProgress() => _handleInProgress,
              AddressSuccess() => _handleSuccess,
              AddressFailure() => _handleFailure,
            };

            handler();
          },
          buildWhen: (previous, current) => current is AddressSuccess,
          builder: (context, state) {
            if (state is! AddressSuccess) return const SizedBox.shrink();

            return Column(
              children: [
                Text('Rua: ${state.address.street}'),
                Text('Cidade: ${state.address.city}'),
                Text('Bairro: ${state.address.district}'),
                Text('DDD: ${state.address.contactCode}'),
                Text('UF: ${state.address.state}'),
                Text('Complemento: ${state.address.complement ?? '-'}'),
              ],
            );
          },
        ),
      ),
    );
  }
}
