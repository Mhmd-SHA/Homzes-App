import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homzes_app/feature/home/data/data_source/home_data_source.dart';
import 'package:homzes_app/feature/home/domain/repository/home_repository.dart';
import 'package:homzes_app/feature/home/domain/usecases/home_fetch_property.dart';

import '../../data/repository/home_repository_impl.dart';

class HomeInject {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final HomePropertyRemoteDataSource homePropertyRemoteDataSource =
      PropertyRemoteDataSourceImpl(firestore: _firestore);
  static final HomePropertyRepository homePropertyRepository =
      HomePropertyRepositoryImpl(
          remoteDataSource: homePropertyRemoteDataSource);

  static final HomeFetchProperties homeFetchProperties =
      HomeFetchProperties(homePropertyRepository);
}
