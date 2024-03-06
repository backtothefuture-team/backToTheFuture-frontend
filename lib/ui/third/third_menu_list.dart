import 'package:flutter/material.dart';

import '../../config/gaps.dart';
import '../../config/my_text.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> menuList = ['공지사항', '약관 및 정책', '고객센터'];
    List<IconData> menuIcons = [
      Icons.notifications_none,
      Icons.info_outline_rounded,
      Icons.question_mark_outlined
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.builder(
          itemCount: menuList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(menuIcons[index]),
                    Gaps.gapW10,
                    Text(
                      menuList[index],
                      style: MyText.fontSize17,
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
