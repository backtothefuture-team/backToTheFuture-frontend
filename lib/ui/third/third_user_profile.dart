import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rest_api_ex/config/gaps.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height * 0.4,
      child: Center(
        child: Column(
          children: [
            Gaps.spacer,

            // 사용자 프로필
            userProfile(context),

            Gaps.spacer,

            // 사용자 메뉴 리스트(주문 내역, 리뷰 관리, 나의 찜)
            privateMenuList()
          ],
        ),
      ),
    );
  }

  // 사용자 프로필
  Widget userProfile(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 프로필 사진
        ClipRRect(
          borderRadius: BorderRadius.circular(125),
          child: Image.asset(
            'assets/images/sample2.png',
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        ),

        Gaps.gapH10,

        // 이름
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '김창영 님',
              style: TextStyle(
                fontSize: 20.0
              ),
            ),

            Icon(Icons.navigate_next)
          ],
        )
      ],
    );
  }

  // 사용자 메뉴 리스트(주문 내역, 리뷰 관리, 나의 찜)
  Widget privateMenuList() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Icon(CupertinoIcons.smiley),
            Text('주문 내역'),
          ],
        ),
        Column(
          children: [
            Icon(CupertinoIcons.smiley),
            Text('리뷰 관리'),
          ],
        ),
        Column(
          children: [
            Icon(CupertinoIcons.smiley),
            Text('나의 찜'),
          ],
        ),
      ],
    );
  }
}
