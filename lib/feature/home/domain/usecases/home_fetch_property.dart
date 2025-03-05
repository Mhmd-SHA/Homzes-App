import 'package:homzes_app/feature/home/domain/entities/property.dart';
import 'package:homzes_app/feature/home/domain/repository/home_repository.dart';

class HomeFetchProperties {
  final HomePropertyRepository repository;

  HomeFetchProperties(this.repository);

  Future<List<Property>> call() async {
    return await repository.getProperties();
  }
}
