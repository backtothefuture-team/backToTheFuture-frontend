import 'package:back_to_the_future/ui/my_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_nav_controller.dart';

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
