import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/repositories/match/match_repository.dart';
import 'package:getx_skeleton/app/repositories/users/user_repository.dart';
import 'package:getx_skeleton/models/match/live_match_model.dart';

import 'index.dart';

class HomeController extends GetxController with MatchRepository {
  HomeController();
  final PageController pageController = PageController(viewportFraction: 0.8);
  final state = HomeState();
  List<String> buttonText = [
    "Ücretsiz Tahminler",
    "Premium Tahminler",
    "Geçmiş Tahminler",
    "Özel Kupon",
    "Geçmiş Kuponlar",
    "Canlı Maçlar"
  ];

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
