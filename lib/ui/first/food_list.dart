import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              }
            ),

            Row(
              children: [
                Image.asset(
                  'assets/images/img.png'
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
