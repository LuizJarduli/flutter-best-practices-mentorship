import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Address extends Equatable {
  const Address({
    required this.postalCode,
    required this.street,
    required this.district,
    required this.state,
    required this.city,
    required this.contactCode,
    this.complement,
  });

  final String postalCode;

  final String street;

  final String district;

  final String state;

  final String city;

  final String? complement;

  final int contactCode;

  @override
  List<Object?> get props => [
        postalCode,
        street,
        district,
        state,
        city,
        contactCode,
        complement,
      ];

  Address copyWith({
    String? postalCode,
    String? street,
    String? district,
    String? state,
    String? city,
    int? contactCode,
    ValueGetter<String?>? complement,
  }) {
    return Address(
      postalCode: postalCode ?? this.postalCode,
      street: street ?? this.street,
      district: district ?? this.district,
      state: state ?? this.state,
      city: city ?? this.city,
      contactCode: contactCode ?? this.contactCode,
      complement: complement != null ? complement() : this.complement,
    );
  }
}
