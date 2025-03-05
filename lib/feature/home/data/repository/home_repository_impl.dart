import 'package:homzes_app/feature/home/data/data_source/home_data_source.dart';

import '../../domain/entities/property.dart';
import '../../domain/repository/home_repository.dart';

class HomePropertyRepositoryImpl implements HomePropertyRepository {
  final HomePropertyRemoteDataSource remoteDataSource;

  HomePropertyRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Property>> getProperties() async {
    final properties = await remoteDataSource.getProperties();
    return properties.map((model) => model).toList();
  }
}
