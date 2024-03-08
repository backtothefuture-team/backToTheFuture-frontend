import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_ex/config/gaps.dart';

class StoreInfo extends StatelessWidget {
  const StoreInfo({required this.selectedStore, super.key});

  final int selectedStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // appBar 배경 이미지
          appBarWidget(context),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [

                  // 가게 정보
                  storeInfo(),

                  // 찜, 길찾기, 공유 버튼
                  placeMenus()
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  // appBar 배경 이미지
  Widget appBarWidget(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.15,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/images/sample.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 가게 정보
  Widget storeInfo() {
   return const Padding(
     padding: EdgeInsets.all(15.0),
     child: Column(
       children: [

         // 가게명
         Text(
           '참바른빵',
           style: TextStyle(
               fontSize: 20.0,
               fontWeight: FontWeight.bold
           ),
         ),

         // 리뷰
         Text('97%(21) 리뷰 16개 >'),

         Divider(color: Colors.grey,),

         // 픽업 가능 시간
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(CupertinoIcons.clock),
             Gaps.gapW5,
             Text('픽업 가능'),
             Gaps.gapW5,
             Text('오후 8:00 ~ 오후 8:30')
           ],
         ),

         // 가게 주소
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(CupertinoIcons.location_solid),
             Gaps.gapW5,
             Text('서울특별시 종로구 명륜3가\n성균관로 1길 6-6, 1층'),
           ],
         ),
       ],
     ),
   );
  }

  // 찜, 길찾기, 공유 메뉴 버튼들
  Widget placeMenus() {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(CupertinoIcons.heart),
              Text('75'),
            ],
          ),

          Text('|'),

          Row(
            children: [
              Icon(CupertinoIcons.arrow_swap),
              Text('길찾기'),
            ],
          ),

          Text('|'),

          Row(
            children: [
              Icon(CupertinoIcons.share),
              Text('공유'),
            ],
          ),
        ],
      ),
    );
  }
}
