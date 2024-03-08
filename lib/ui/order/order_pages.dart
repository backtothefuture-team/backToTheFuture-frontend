import 'package:flutter/material.dart';
import 'package:rest_api_ex/ui/order/pick_up_time_info.dart';

class OrderPages extends StatelessWidget {
  const OrderPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('예약하기'),
      ),
      body: Column(
        children: [

          // 픽업 시간 정보
          PickUpTimeInfo(),


        ],
      ),
    );
  }
}
