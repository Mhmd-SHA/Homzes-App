import 'package:equatable/equatable.dart';

class Property extends Equatable {
  final String title;
  final String image;
  final String location;
  final int price;
  final int beds;
  final int bathrooms;

  const Property({
    required this.title,
    required this.image,
    required this.location,
    required this.price,
    required this.beds,
    required this.bathrooms,
  });

  @override
  List<Object?> get props => [title, image, location, price, beds, bathrooms];
}
