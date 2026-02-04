import '../../domain/entities/project.dart';
import '../../domain/entities/skill.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../sources/portfolio_local_data_source.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioDataSource dataSource;

  PortfolioRepositoryImpl({required this.dataSource});

  @override
  Future<List<Project>> getProjects() {
    return dataSource.getProjects();
  }

  @override
  Future<List<Skill>> getSkills() {
    return dataSource.getSkills();
  }
}
