import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class HttpResponse<T> extends Equatable {
  const HttpResponse({required this.statusCode, required this.body});

  final int statusCode;

  final T body;

  @override
  List<Object?> get props => [statusCode, body];
}
