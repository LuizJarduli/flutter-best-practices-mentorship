import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_best_practices_bloc/address/model/address_model.dart';

class AddressResponseDTO extends Equatable {
  const AddressResponseDTO({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  factory AddressResponseDTO.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'cep': final String cep,
        'logradouro': final String logradouro,
        'complemento': final String? complemento,
        'bairro': final String bairro,
        'localidade': final String localidade,
        'uf': final String uf,
        'ibge': final String? ibge,
        'gia': final String? gia,
        'ddd': final String ddd,
        'siafi': final String? siafi
      } =>
        AddressResponseDTO(
          cep: cep,
          bairro: bairro,
          complemento: complemento,
          ddd: ddd,
          gia: gia,
          ibge: ibge,
          localidade: localidade,
          logradouro: logradouro,
          siafi: siafi,
          uf: uf,
        ),
      _ => throw Exception('JSON response not supported: $json'),
    };
  }

  final String cep;

  final String logradouro;

  final String? complemento;

  final String bairro;

  final String localidade;

  final String uf;

  final String? ibge;

  final String? gia;

  final String ddd;

  final String? siafi;

  @override
  List<Object?> get props {
    return [
      cep,
      logradouro,
      complemento,
      bairro,
      localidade,
      uf,
      ibge,
      gia,
      ddd,
      siafi,
    ];
  }

  AddressResponseDTO copyWith({
    String? cep,
    String? logradouro,
    ValueGetter<String?>? complemento,
    String? bairro,
    String? localidade,
    String? uf,
    ValueGetter<String?>? ibge,
    ValueGetter<String?>? gia,
    String? ddd,
    ValueGetter<String?>? siafi,
  }) {
    return AddressResponseDTO(
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      complemento: complemento != null ? complemento() : this.complemento,
      bairro: bairro ?? this.bairro,
      localidade: localidade ?? this.localidade,
      uf: uf ?? this.uf,
      ibge: ibge != null ? ibge() : this.ibge,
      gia: gia != null ? gia() : this.gia,
      ddd: ddd ?? this.ddd,
      siafi: siafi != null ? siafi() : this.siafi,
    );
  }

  Address toAddress() {
    return Address(
      postalCode: cep,
      street: logradouro,
      district: bairro,
      state: uf,
      city: localidade,
      contactCode: int.parse(ddd),
      complement: complemento,
    );
  }
}
