import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_nav_controller.dart';
import 'my_bottom_navigation.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavController>(create: (_) => BottomNavController())
      ],
      child: const MyBottomNavigation(),
    );
  }
}
