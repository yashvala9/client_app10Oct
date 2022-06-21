import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reel_ro/utils/assets.dart';
import 'package:reel_ro/utils/colors.dart';

import '../../../data/demo_data.dart';
import '../controllers/winners_controller.dart';
import 'widgets/winnercard_widget.dart';
import 'widgets/winnerheaderimage_widget.dart';

class WinnersView extends GetView<WinnersController> {
  @override
  Widget build(BuildContext context) {
    Get.put(WinnersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Winners',
          style: TextStyle(fontSize: 14),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
      ),
      body: SizedBox(
        width: Get.height,
        height: Get.height,
        child: Stack(
          children: [
            Center(child: Image.asset(Assets.winnerScreenBackground, fit: BoxFit.none, width: Get.width, height: Get.height)),
            Column(
              children: [
                const WinnerHeaderImage(),
                Expanded(
                  child: Obx(() => controller.isLoading == false
                      ? ListView.builder(
                          itemCount: controller.winnerList.length,
                          itemBuilder: (context, index) {
                            return WinnerCardWidget(winnerList: controller.winnerList[index]);
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                          color: Colors.yellow,
                          backgroundColor: Colors.red,
                        ))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
