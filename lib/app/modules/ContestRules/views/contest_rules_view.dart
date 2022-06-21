import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contest_rules_controller.dart';

class ContestRulesView extends GetView<ContestRulesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ContestRulesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ContestRulesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
