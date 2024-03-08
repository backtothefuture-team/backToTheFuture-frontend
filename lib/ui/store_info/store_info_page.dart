import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_ex/config/gaps.dart';
import 'package:rest_api_ex/ui/store_info/food_list.dart';
import 'package:rest_api_ex/ui/store_info/store_info.dart';

class StoreInfoPage extends StatelessWidget {
  const StoreInfoPage({required this.selectedStoreIndex, super.key});

  final int selectedStoreIndex;

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
                  StoreInfo(selectedStoreIndex: selectedStoreIndex),

                  // 메뉴 정보
                  FoodList()
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
}
