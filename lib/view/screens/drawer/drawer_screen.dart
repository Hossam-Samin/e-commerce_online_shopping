import 'package:e_commerce/view/screens/app_layout/app_layout.dart';
import 'package:e_commerce/view/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../menu_screen/menu_screen.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({Key? key}) : super(key: key);

  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      style: DrawerStyle.defaultStyle,
      menuScreen: const MenuScreen(),
      mainScreen: const HomeScreen(),
      borderRadius: 40.0,
      showShadow: true,
      angle: 0.0,
      drawerShadowsBackgroundColor: Colors.grey.withOpacity(.2),
      slideWidth: MediaQuery.of(context).size.width * .45,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      androidCloseOnBackTap: true,
      mainScreenTapClose: true,
      menuScreenWidth: 180,
      moveMenuScreen: true,
      shadowLayer1Color: Colors.deepPurple.withOpacity(.2),
    );
  }
}
