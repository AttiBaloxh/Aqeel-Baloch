import '../../domain/entities/project.dart';

class ProjectModel extends Project {
  const ProjectModel({
    required super.title,
    required super.description,
    super.longDescription,
    required super.imageUrl,
    required super.link,
    required super.techStack,
    required super.category,
    super.features,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      title: json['title'],
      description: json['description'],
      longDescription: json['longDescription'],
      imageUrl: json['imageUrl'],
      link: json['link'],
      techStack: List<String>.from(json['techStack']),
      category: json['category'],
      features: json['features'] != null
          ? List<String>.from(json['features'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'longDescription': longDescription,
      'imageUrl': imageUrl,
      'link': link,
      'techStack': techStack,
      'category': category,
      'features': features,
    };
  }
}
