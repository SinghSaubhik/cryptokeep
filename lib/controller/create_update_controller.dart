import 'package:cryptokeep/controller/home_controller.dart';
import 'package:cryptokeep/models/login_model.dart';
import 'package:cryptokeep/utils/common.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreateUpdateController extends GetxController {
  final titleController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginAction action;
  String id;

  @override
  void onInit() {
    super.onInit();
    populateUpdateData(Get.arguments);
    // print(Get.arguments.title);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void populateUpdateData(Login login) {
    if (login == null) {
      titleController.clear();
      usernameController.clear();
      passwordController.clear();
    } else {
      titleController.text = login.title;
      usernameController.text = login.username;
      passwordController.text = login.password;
    }
  }

  void onSubmit(BuildContext context, Login login) async {
    final _controller = Get.find<HomeController>();
    var value = {
      "title": titleController.value.text,
      "username": usernameController.value.text,
      "password": passwordController.value.text
    };

    if (!formKey.currentState.validate()) return;

    if (Get.currentRoute == "/create") {
      _controller.add(Login.fromValue(value));
    } else {
      login.update(value);
      _controller.updateItem(login.id, login);
    }
    Navigator.pop(context);
  }

  /// Validators //////////////////////////////////
  /// //////////////////////////////////////////////

  String titleValidator(String v) {
    if (v.isEmpty) return "Please enter title";
    return null;
  }

  String usernameValidator(String v) {
    if (v.isEmpty) return "Please enter username";
    return null;
  }

  String passwordValidator(String v) {
    if (v.isEmpty) return "Please enter password";
    if (!GetUtils.isLengthBetween(v, 6, 128))
      return "Password length should be between 6-128 chars";

    return null;
  }
}
