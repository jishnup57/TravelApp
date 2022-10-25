import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/Settings/controllers/profile_controller.dart';
import 'package:travel_aliga/app/modules/signin/views/widget/textfield.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';

enum AdressType { temporary, permanent }

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    log('ProfileView build');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.kWhiteColor,
      body: SafeArea(
          child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: GetBuilder<ProfileController>(builder: (controller) {
          return Form(
            key: controller.formKey,
            child: ListView(children: [
              Image.asset('asset/image/address.png'),
              AddressField(
                  hint: 'Name',
                  textController: ProfileController.nameController,
                  icon: Icons.person),
              AddressField(
                hint: 'Address',
                textController: ProfileController.addressController,
                icon: Icons.home,
                maxline: 5,
                keyType: TextInputType.multiline,
              ),
              AddressField(
                  hint: 'Age',
                  textController: ProfileController.ageController,
                  icon: Icons.pin,
                  keyType: TextInputType.number),
              AddressField(
                  hint: 'City',
                  textController: ProfileController.cityController,
                  icon: Icons.location_city),
              AddressField(
                hint: 'Pincode',
                textController: ProfileController.pincodeController,
                icon: Icons.fiber_pin,
                keyType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                          value: AdressType.permanent,
                          groupValue: controller.adressType,
                          onChanged: (AdressType? value) {
                            controller.changerRadio(value!);
                            controller.setPermenent();
                          }),
                      Text(
                        'Permanent ',
                        style: AppStyle.kLoginIntermedText,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: AdressType.temporary,
                          groupValue: controller.adressType,
                          onChanged: (AdressType? value) {
                            if(controller.addressList.isEmpty){
                              return;
                            }
                            controller.changerRadio(value!);
                            controller.setTempAdd();
                          }),
                      Text(
                        'Temporary',
                        style: AppStyle.kLoginIntermedText,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Obx(
                  () => MaterialButton(
                    onPressed: () {
                      controller.onSubmit(controller.adressType);
                    },
                    child: controller.isLoading.value
                        ? CupertinoActivityIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Submit',
                            style: AppStyle.kLoginIntermedText.copyWith(
                                color: Colors.white, letterSpacing: 1.2),
                          ),
                    color: AppColor.kPrimaryColor,
                    height: 45,
                  ),
                ),
              ),
              AppStyle.kHight20,
            ]),
          );
        }),
      )),
    );
  }
}

class AddressField extends StatelessWidget {
  const AddressField({
    Key? key,
    required this.textController,
    required this.hint,
    required this.icon,
    this.maxline = 1,
    this.keyType = TextInputType.emailAddress,
  }) : super(key: key);
  final TextEditingController textController;
  final String hint;
  final IconData icon;
  final int maxline;
  final TextInputType keyType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              '$hint :',
              style: AppStyle.kLoginIntermedText,
            ),
          ),
          TextfieldWidget(
            hint: hint,
            textcontroller: textController,
            icon: icon,
            maxLines: maxline,
            keyType: keyType,
          ),
        ],
      ),
    );
  }
}
