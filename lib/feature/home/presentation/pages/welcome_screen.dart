import 'package:flutter/material.dart';
import 'package:homzes_app/core/common/widgets/app_button.dart';
import 'package:homzes_app/core/config/app_colors.dart';
import 'package:homzes_app/feature/home/presentation/pages/home_screen.dart';
import 'package:homzes_app/feature/home/presentation/widgets/service_card_widget.dart';

import '../../domain/entities/service.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/house.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/Homzes.png",
                      color: Colors.white,
                    ),
                    DrawerButton(
                      //Drawer button is not necessary here!!! It's just for the demo
                      color: AppColors.white,
                      style: ButtonStyle(
                          side: WidgetStatePropertyAll(
                              BorderSide(color: AppColors.white))),
                    )
                  ],
                ),
                Spacer(),
                Center(
                  child: Text(
                    "Find the best \nPlace for you",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                        ),
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ServiceCardWidget(
                      cardColor: sampleServices[index].cardColor,
                      icon: sampleServices[index].icon,
                      title: sampleServices[index].title,
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 12),
                  ),
                ),
                SizedBox(height: 20),
                PrimaryElevatedButton(
                  text: "Continue",
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            HomeScreen(),
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
                      (route) => false,
                    );
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
