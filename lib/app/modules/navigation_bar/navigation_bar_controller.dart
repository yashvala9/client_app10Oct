import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reel_ro/app/modules/add_feed/widgets/video_trimmer_view.dart';
import 'package:reel_ro/app/routes/app_routes.dart';
import 'package:reel_ro/repositories/auth_repository.dart';

import '../../../utils/video_player_iten.dart';

class NavigationBarController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    print('running pause $index');
    tabIndex.value = index;
    if (index != 0) {
      print('running pause');
      VideoPlayerItemState().dispose();
    }
  }
}
