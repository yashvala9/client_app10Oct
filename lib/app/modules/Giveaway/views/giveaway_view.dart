import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reel_ro/app/modules/ContestDates/views/contest_dates_view.dart';
import 'package:reel_ro/app/modules/winners/views/winners_view.dart';
import 'package:reel_ro/utils/colors.dart';

import '../../ContestRules/views/contest_rules_view.dart';
import '../controllers/giveaway_controller.dart';
import 'widgets/giveawaycard_widget.dart';

class GiveawayView extends GetView<GiveawayController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giveaway'),
        foregroundColor: AppColors.lightBlack,
        backgroundColor: AppColors.whiteappbar,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              height: 168,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.darkred,
              ),
            ),
            GiveAwayCard(
              title: 'Winner',
              onTap: () {
                Get.to(WinnersView());
              },
            ),
            GiveAwayCard(
              title: 'Contest Dates',
              onTap: () {
                Get.to(ContestDatesView());
              },
            ),
            GiveAwayCard(
              title: 'Contest Rules',
              onTap: () {
                Get.to(ContestRulesView());
              },
            ),
            GiveAwayCard(
              title: 'Ads History',
              onTap: () {},
            ),
          ],
        ),
      )),
    );
  }
}
