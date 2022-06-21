import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reel_ro/app/data/demo_data.dart';
import 'package:reel_ro/utils/colors.dart';

class ContestCard_widget extends StatelessWidget {
  ContestDates contestDates;
  ContestCard_widget({Key? key, required this.contestDates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 278,
      width: Get.size.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(238, 200, 101, 1),
            Color.fromRGBO(255, 230, 84, 1),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(contestDates.title ?? '--',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.winnercardbrown,
              )),
          Image.network(
            contestDates.imageurl ?? 'http://via.placeholder.com/640x360',
            fit: BoxFit.cover,
            width: 150,
            height: 90,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Prize',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.winnercardbrown,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(width: 10),
              Text(
                contestDates.prize ?? '--',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.winnercardpink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            'Contest ends on ${contestDates.endOn}',
            style: TextStyle(
              fontSize: 21,
              color: AppColors.winnercardbrown,
            ),
          ),
        ],
      ),
    );
  }
}
