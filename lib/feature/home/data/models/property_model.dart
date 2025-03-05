import '../../domain/entities/property.dart';

class PropertyModel extends Property {
  const PropertyModel({
    required super.title,
    required super.image,
    required super.location,
    required super.price,
    required super.beds,
    required super.bathrooms,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      title: json['title'],
      image: json['image'],
      location: json['location'],
      price: json['price'],
      beds: json['beds'],
      bathrooms: json['bathrooms'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'location': location,
      'price': price,
      'beds': beds,
      'bathrooms': bathrooms,
    };
  }
}
