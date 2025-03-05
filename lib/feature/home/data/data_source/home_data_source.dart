import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/property_model.dart';

abstract class HomePropertyRemoteDataSource {
  Future<List<PropertyModel>> getProperties();
}

class PropertyRemoteDataSourceImpl implements HomePropertyRemoteDataSource {
  final FirebaseFirestore firestore;

  PropertyRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<PropertyModel>> getProperties() async {
    final snapshot = await firestore.collection('properties').get();
    return snapshot.docs
        .map((doc) => PropertyModel.fromJson(doc.data()))
        .toList();
  }
}
