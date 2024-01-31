import 'dart:convert';
import 'dart:io';

import 'package:akshaypratical/AppApi/apis.dart';
import 'package:akshaypratical/models/login_model.dart';
import 'package:akshaypratical/screens/home_screen/home_screen.dart';
import 'package:akshaypratical/screens/login_screen/login_screen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class LoginController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginModel loginModel = LoginModel();
  GetStorage storage = GetStorage();
  var dialCode;

  final formKey = GlobalKey<FormState>();

  Future<String?> getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
  }

  Future logIn() async {
    String? deviceId = await getId();
    print("=================$deviceId");
    var url = Uri.parse(AppApi.loginApi);

    try {
      http.post(url, body: {
        "country_code": dialCode,
        "mobile": phoneNumberController.text.toString(),
        "password": passwordController.text.toString(),
        "push_token": "",
        "device_type": "android",
        "device_id": deviceId,
      }, headers: {
        'Accept': 'application/json'
      }).then((value) {
        if (value.statusCode == 200) {
          print("Response------${value.body}");
          loginModel = LoginModel.fromJson(json.decode(value.body));
          if (loginModel.status == 200) {
            storage.write("token", loginModel.data?.token);
            Fluttertoast.showToast(msg: "${loginModel.message}");
            Get.offAll(HomeScreen());
          }
        }
      });
    } catch (e) {
      print("ERROR---$e");
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
