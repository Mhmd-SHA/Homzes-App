import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homzes_app/feature/home/presentation/bloc/home_bloc.dart'; // Adjust the import path as needed
import 'package:homzes_app/core/config/app_colors.dart';
import 'package:homzes_app/feature/home/presentation/pages/search_screen.dart';

import '../../domain/entities/property.dart'; // For Navigator.go

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor2, // Light yellow
        leading: IconButton(
          icon: Icon(Icons.menu, color: AppColors.dark100),
          onPressed: () {
            // Handle menu action (e.g., open drawer)
          },
        ),
        toolbarHeight: kToolbarHeight,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(18),
                bottomLeft: Radius.circular(18))),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  prefixIcon: Icon(Icons.search, color: AppColors.dark60),
                  filled: true,
                  fillColor: AppColors.white,
                ),
              ),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                Text(
                  'Hi, Shafir',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 6),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.backgroundColor1, // Pink
                  child: Text(
                    'S',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar

            // Featured Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            SearchCatalog1Screen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;
                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Text(
                    'View all',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.dark10,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 200,
              child: BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  switch (state) {
                    case HomeInitial():
                      return Center(
                          child: CircularProgressIndicator(
                              color: AppColors.dark100));
                    case HomeLoading():
                      return Center(
                          child: CircularProgressIndicator(
                              color: AppColors.dark100));
                    case HomeLoaded():
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.properties.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final property = state.properties[index];
                          return _buildPropertyCard(property, context);
                        },
                      );
                    case HomeError():
                      return Center(
                          child: Text(state.message,
                              style: TextStyle(color: AppColors.dark100)));
                  }
                },
              ),
            ),
            // New Offers Section
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New offers',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Using GoRouter for navigation with named route
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            SearchCatalog1Screen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;
                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Text(
                    'View all',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.dark10,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),

            // New Offers Property (Single Card)
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return Center(
                      child:
                          CircularProgressIndicator(color: AppColors.dark100));
                } else if (state is HomeLoaded) {
                  final property =
                      state.properties.isNotEmpty ? state.properties[0] : null;
                  if (property == null) {
                    return Center(
                        child: Text('No new offers available',
                            style: TextStyle(color: AppColors.dark100)));
                  }
                  return _buildNewOfferCard(property, context);
                } else if (state is HomeError) {
                  return Center(
                      child: Text(state.message,
                          style: TextStyle(color: AppColors.dark100)));
                }
                return Center(
                    child: Text('No data available',
                        style: TextStyle(color: AppColors.dark100)));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyCard(Property property, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: property.image,
          child: Container(
            width: 150,
            height: 150,
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  property.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: AppColors.white,
              ),
              child: Text(
                '\$${property.price}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.dark100,
                    ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          property.title,
          maxLines: 2,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.dark100,
                fontWeight: FontWeight.bold,
              ),
        )
      ],
    );
  }

  Widget _buildNewOfferCard(Property property, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16), bottom: Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: property.image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      Icon(Icons.image_not_supported, color: AppColors.dark40),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(Icons.favorite_border,
                      color: AppColors.secondaryColor), // Pink heart
                  onPressed: () {
                    // Handle favorite action
                  },
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    color: AppColors.white,
                  ),
                  child: Text(
                    '\$${property.price}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.dark100,
                        ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      property.title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.dark100,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_outline_rounded,
                          color: AppColors.primaryColor,
                          size: 16,
                        ), // Green star
                        SizedBox(width: 4),
                        Text(
                          '4.9 ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.dark100,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          '(29 Reviews)',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.dark20,
                                    fontWeight: FontWeight.bold,
                                  ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
