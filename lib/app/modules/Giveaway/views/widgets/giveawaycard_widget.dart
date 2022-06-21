import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiveAwayCard extends StatelessWidget {
  String title;
  VoidCallback onTap;
  GiveAwayCard({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 80,
            width: Get.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
              Radius.circular(15),
            )),
            child: Center(child: Text(title)),
          ),
        ),
      ),
    );
  }
}
