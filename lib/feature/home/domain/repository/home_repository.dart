import '../entities/property.dart';

abstract class HomePropertyRepository {
  Future<List<Property>> getProperties();
}
