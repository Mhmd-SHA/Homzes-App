import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';

class Service {
  final Color cardColor;
  final IconData icon;
  final String title;

  Service({
    required this.cardColor,
    required this.icon,
    required this.title,
  });
}

final List<Service> sampleServices = [
  Service(
    cardColor: AppColors.backgroundColor1, // Light beige
    icon: Icons.home_outlined, // Icon for Rent
    title: 'Rent',
  ),
  Service(
    cardColor: AppColors.backgroundColor2, // Light yellow
    icon: Icons.shopping_bag_outlined, // Icon for Buy
    title: 'Buy',
  ),
  Service(
    cardColor: AppColors.backgroundColor3, // Light green
    icon: Icons.swap_horiz_outlined, // Icon for Sell
    title: 'Sell',
  ),
];
