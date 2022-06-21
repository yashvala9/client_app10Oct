import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reel_ro/app/data/demo_data.dart';
import 'package:reel_ro/utils/assets.dart';
import 'package:reel_ro/utils/colors.dart';

class WinnerHeaderImage extends StatelessWidget {
  const WinnerHeaderImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(12.0),
      height: 223,
      width: Get.size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Stack(
        children: [
          Image.asset(Assets.winnerHeaderImage),
          Positioned(
            bottom: 0,
            // left: Get.width * 0.5,
            child: Container(
              padding: const EdgeInsets.only(bottom: 12),
              width: Get.size.width,
              child: Center(
                child: Text(
                  'Mega Prize Winner',
                  style: TextStyle(
                    fontSize: 28,
                    color: AppColors.whiteappbar,
                    fontWeight: FontWeight.bold,
                    shadows: const <Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 10.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
