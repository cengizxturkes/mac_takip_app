import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_snackbar.dart';
import 'package:getx_skeleton/app/modules/Login/widgets/login_page_custom_painter.dart';
import 'package:getx_skeleton/app/modules/Login/widgets/register_form.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

import '../../repositories/users/user_repository.dart';
import 'index.dart';

enum FormType { login, register }

class LoginController extends GetxController {
  LoginController();
  UserRepository repository = UserRepository();
  Rx<FormType> formType = FormType.login.obs;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController rePassword = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  final state = LoginState();

  final painter = CustomPaint(
    size: Size(375.w, 812.h),
    painter: LoginPageCustomPainter(
        color: Theme.of(Get.context!).colorScheme.tertiary),
  );
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

  Future<bool> loginUser(String email, String password) async {
    var result = await repository.login(email, password);

    if (result) {
      Get.offAndToNamed(Routes.HOME);
      return true;
    } else {
      CustomSnackBar.showCustomToast(message: "giriş yapılamadı");
    }
    return false;
  }

  Future<bool> registerUser(String name, String email, String password) async {
    var result = await repository.register(name, email, password);

    if (result.status ?? false) {
      Get.offAndToNamed(Routes.HOME);
      return true;
    } else {
      CustomSnackBar.showCustomToast(message: result.message ?? "");
    }
    return false;
  }
}
