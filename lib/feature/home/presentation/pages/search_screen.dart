import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_colors.dart';
import '../bloc/home_bloc.dart';

class SearchCatalog1Screen extends StatelessWidget {
  const SearchCatalog1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor3, // Light yellow
        leading: DrawerButton(
          //Drawer button is not necessary here!!! It's just for the demo
          color: AppColors.white,

          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.dark80),
          ),
        ),

        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
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
        ),
        toolbarHeight: kToolbarHeight + 50,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(18),
                bottomLeft: Radius.circular(18))),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Featured Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Popular rent offers ',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            // Property List
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return Center(
                        child: CircularProgressIndicator(color: Colors.black));
                  } else if (state is HomeLoaded) {
                    return ListView.separated(
                      itemCount: state.properties.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final property = state.properties[index];
                        return SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Hero(
                                    tag: property.image,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(20),
                                          top: Radius.circular(20)),
                                      child: CachedNetworkImage(
                                        imageUrl: property.image,
                                        height: 200,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.image_not_supported,
                                                color: AppColors.dark40),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: IconButton(
                                      icon: Icon(Icons.favorite_border,
                                          color: AppColors.white), // Pink heart
                                      onPressed: () {
                                        // Handle favorite action
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    left: 8,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          margin: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(26),
                                            color: AppColors.white,
                                          ),
                                          child: Text(
                                            '${property.beds} Beds',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: AppColors.dark100,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          margin: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(26),
                                            color: AppColors.white,
                                          ),
                                          child: Text(
                                            '${property.bathrooms} Bathrooms',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: AppColors.dark100,
                                                ),
                                          ),
                                        )
                                      ],
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              property.title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    color: AppColors.dark100,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Text(
                                              property.location,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: AppColors.dark40,
                                                  ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '\$${property.price}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.copyWith(
                                                    color: AppColors.dark100,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Text(
                                              ' / mo',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    color: AppColors.dark100,
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
                      },
                    );
                  } else if (state is HomeError) {
                    return Center(child: Text(state.message));
                  }
                  return Center(child: Text('No data available'));
                },
              ),
            ),
            // View All Button
          ],
        ),
      ),
    );
  }
}
