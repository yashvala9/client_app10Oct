import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reel_ro/utils/colors.dart';

import '../controllers/contest_rules_controller.dart';

class ContestRulesView extends GetView<ContestRulesController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ContestRulesController());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Contest Rules',
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
        body: Obx(
          () => controller.isLoading == false
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: controller.contestRulesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.contestrulesbrown,
                            AppColors.contestrulesligthbrown,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.contestRulesList[index].title.toString(),
                              style: const TextStyle(color: AppColors.winnercardbrown, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.contestRulesList[index].rules!.length,
                              itemBuilder: (BuildContext context, int index1) {
                                return Text(controller.contestRulesList[index].rules!.cast().values.elementAt(index1).toString());
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.yellow,
                    backgroundColor: Colors.red,
                  ),
                ),
        ));
  }
}
