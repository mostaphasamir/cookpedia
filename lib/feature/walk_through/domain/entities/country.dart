import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String flagURL;

  final String code;

  final String name;

  const Country({
    required this.flagURL,
    required this.code,
    required this.name,
  });

  @override
  List<Object> get props => [flagURL, code, name];
}
