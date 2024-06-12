import 'package:flutter_best_practices_bloc/address/cubit/address_cubit.dart';
import 'package:flutter_best_practices_bloc/address/repository/address_repository.dart';
import 'package:flutter_best_practices_bloc/address/repository/address_repository_viacep_impl.dart';
import 'package:flutter_best_practices_bloc/address/use_case/get_cep_usecase.dart';
import 'package:flutter_best_practices_bloc/address/use_case/get_cep_usecase_impl.dart';
import 'package:flutter_best_practices_bloc/core/http_client/http_client.dart';
import 'package:flutter_best_practices_bloc/core/http_client/http_client_impl.dart';
import 'package:flutter_best_practices_bloc/core/module_binder/binder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:nested/nested.dart';

class ModuleBinder extends Binder {
  @override
  List<SingleChildWidget> get binds => [
        RepositoryProvider(create: (context) => http.Client()), // http
        RepositoryProvider<HttpClient>(
          create: (context) => HttpClientImpl(
            context.read<http.Client>(),
          ),
        ),
        RepositoryProvider<AddressRepository>(
          create: (context) => AddressRepositoryViacepImpl(
            context.read<HttpClient>(),
          ),
        ),
        RepositoryProvider<GetCepUseCase>(
          create: (context) => GetCepUseCaseImpl(
            context.read<AddressRepository>(),
          ),
        ),
        BlocProvider<AddressCubit>(
          create: (context) => AddressCubit(
            context.read<GetCepUseCase>(),
          ),
        ),
      ];
}
