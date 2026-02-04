import '../../domain/entities/skill.dart';

class SkillModel extends Skill {
  const SkillModel({
    required super.name,
    required super.iconPath,
    required super.category,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'],
      iconPath: json['iconPath'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'iconPath': iconPath, 'category': category};
  }
}
