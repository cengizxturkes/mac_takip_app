import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/CustomBottomNavbar/custom_bottom_navbar_item.dart';
import 'package:getx_skeleton/app/components/CustomBottomNavbar/custom_buttom_navbar.dart';

import '../../utils/color_manager.dart';
import '../routes/app_pages.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key, required this.child}) : super(key: key);
  final Widget? child;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: widget.child ?? const Center(child: Text("Error")),
        ),
        backgroundColor: ColorManager.base20,
        bottomNavigationBar: CustomBottomNavbar(
          items: [
            CustomBottomNavbarItem(
                item: BottomBarItem(
                  inActiveItem: AnimatedIcon(
                    icon: AnimatedIcons.home_menu,
                    progress:
                        AnimationController(vsync: this, duration: 1.seconds),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  activeItem: AnimatedIcon(
                    icon: AnimatedIcons.home_menu,
                    progress:
                        AnimationController(vsync: this, duration: 1.seconds),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                onClickItem: () {
                  Get.toNamed(Routes.HOME);
                }),
            CustomBottomNavbarItem(
                item: BottomBarItem(
                  inActiveItem: Icon(
                    Icons.local_activity,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  activeItem: Icon(
                    Icons.local_activity,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                onClickItem: () {
                  Get.toNamed(Routes.PRECOUPON);
                }),
            CustomBottomNavbarItem(
                item: BottomBarItem(
                  inActiveItem: Icon(
                    Icons.sports_soccer_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  activeItem: Icon(
                    Icons.sports_soccer_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                onClickItem: () {
                  Get.toNamed(Routes.FREECOUPON);
                }),
            CustomBottomNavbarItem(
                item: BottomBarItem(
                  inActiveItem: Icon(
                    Icons.analytics_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  activeItem: Icon(
                    Icons.analytics_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                onClickItem: () {
                  Get.toNamed(Routes.LIVE);
                }),
            CustomBottomNavbarItem(
                item: BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                onClickItem: () {
                  Get.toNamed(Routes.PROFILE);
                }),
          ],
        ),
      ),
    );
  }
}
