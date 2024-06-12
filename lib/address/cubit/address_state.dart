part of 'address_cubit.dart';

sealed class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object?> get props => [];
}

final class AddressInitial extends AddressState {}

final class AddressInProgress extends AddressState {}

final class AddressSuccess extends AddressState {
  const AddressSuccess({required this.address});

  final Address address;

  @override
  List<Object?> get props => [address];
}

final class AddressFailure extends AddressState {}
