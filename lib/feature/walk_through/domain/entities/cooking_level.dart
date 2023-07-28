import 'package:equatable/equatable.dart';

class CookingLevel extends Equatable {
  final String title;

  final String description;

  const CookingLevel({
    required this.title,
    required this.description,
  });

  @override
  List<Object> get props => [title, description];
}
