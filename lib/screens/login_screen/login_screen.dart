import 'package:akshaypratical/controllers/login_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "asset/background.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    left: 45,
                    top: 80,
                    child: Image.asset("asset/Fundtool.png")),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Form(
                    key: controller.formKey,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35)),
                          color: Colors.white),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Please loging your account",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF212121)),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: controller.phoneNumberController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter number';
                              }
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                prefixIcon: CountryCodePicker(
                                  onChanged: (value) {
                                    controller.dialCode = value.dialCode;
                                  },
                                  hideMainText: true,
                                  showDropDownButton: true,
                                  alignLeft: true,
                                ),
                                hintText: "Phone Number",
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)))),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: controller.passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter password';
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Password",
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)))),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.logIn();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                gradient: LinearGradient(colors: [
                                  Color(0xFF2C82AF),
                                  Color(0xFF295772),
                                ]),
                              ),
                              child: Center(
                                  child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Didn’t get any account ?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 15),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Color(0xFF2B607B)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
