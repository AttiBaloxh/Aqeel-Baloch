import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final String title;
  final String description;
  final String? longDescription;
  final String imageUrl;
  final String link;
  final List<String> techStack;
  final String category;
  final List<String>? features;

  const Project({
    required this.title,
    required this.description,
    this.longDescription,
    required this.imageUrl,
    required this.link,
    required this.techStack,
    required this.category,
    this.features,
  });

  @override
  List<Object?> get props => [
    title,
    description,
    longDescription,
    imageUrl,
    link,
    techStack,
    category,
    features,
  ];
}
