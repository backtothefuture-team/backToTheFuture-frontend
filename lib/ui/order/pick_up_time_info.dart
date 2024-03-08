import 'package:flutter/material.dart';

class PickUpTimeInfo extends StatelessWidget {
  const PickUpTimeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('픽업 희망 시간'),
        Row(
          children: [
            Text(
              '오후 8:00 ~ 오후 8:30',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(' 사이 시간을 입력해 주세요.')
          ],
        ),
      ],
    );
  }
}
