import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/portfolio_repository_impl.dart';
import '../../data/sources/portfolio_local_data_source.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/skill.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../../domain/usecases/get_projects.dart';
import '../../domain/usecases/get_skills.dart';

// Data Source Provider
final portfolioDataSourceProvider = Provider<PortfolioDataSource>((ref) {
  return PortfolioLocalDataSourceImpl();
});

// Repository Provider
final portfolioRepositoryProvider = Provider<PortfolioRepository>((ref) {
  final dataSource = ref.watch(portfolioDataSourceProvider);
  return PortfolioRepositoryImpl(dataSource: dataSource);
});

// Use Case Providers
final getProjectsUseCaseProvider = Provider<GetProjects>((ref) {
  final repository = ref.watch(portfolioRepositoryProvider);
  return GetProjects(repository);
});

final getSkillsUseCaseProvider = Provider<GetSkills>((ref) {
  final repository = ref.watch(portfolioRepositoryProvider);
  return GetSkills(repository);
});

// State Providers (Using Use Cases)
final projectsProvider = FutureProvider<List<Project>>((ref) async {
  final useCase = ref.watch(getProjectsUseCaseProvider);
  return useCase.execute();
});

final skillsProvider = FutureProvider<List<Skill>>((ref) async {
  final useCase = ref.watch(getSkillsUseCaseProvider);
  return useCase.execute();
});
