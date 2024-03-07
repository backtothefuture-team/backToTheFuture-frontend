import 'package:flutter/material.dart';
import 'package:rest_api_ex/ui/third/third_menu_list.dart';
import 'package:rest_api_ex/ui/third/third_recent_order_list.dart';
import 'package:rest_api_ex/ui/third/third_user_profile.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ThirdPage'),
      ),

      body: const SingleChildScrollView(
        child: Column(
          children: [
            UserProfile(),
            RecentOrderList(),
            Divider(color: Colors.grey,),
            MenuList()
          ],
        ),
      ),
    );
  }
}
