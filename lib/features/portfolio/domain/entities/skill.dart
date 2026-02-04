import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  final String name;
  final String iconPath;
  final String category;

  const Skill({
    required this.name,
    required this.iconPath,
    required this.category,
  });

  @override
  List<Object?> get props => [name, iconPath, category];
}
