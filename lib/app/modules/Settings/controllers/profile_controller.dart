import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/Settings/model/adress_model.dart';
import 'package:travel_aliga/app/modules/Settings/services/api_service.dart';
import 'package:travel_aliga/app/modules/Settings/views/widget/screen_profile.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';
import 'package:sqflite/sqflite.dart';

class ProfileController extends GetxController {
  static TextEditingController nameController = TextEditingController();
  static TextEditingController addressController = TextEditingController();
  static TextEditingController ageController = TextEditingController();
  static TextEditingController pincodeController = TextEditingController();
  static TextEditingController cityController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  List<AddressModel> addressList = [];
  static late Database _database;
  AddressModel? permanentAddress;
  AddressModel? temporaryAddress;
  AdressType adressType = AdressType.permanent;
  @override
  void onInit() async {
    await getAllAddress();
    await setPermenent();
    super.onInit();
  }

  @override
  dispose() {
    super.dispose();
    nameController.dispose();
    addressController.dispose();
    ageController.dispose();
    pincodeController.dispose();
    cityController.dispose();
  }

  changerRadio(AdressType value) {
    adressType = value;
    update();
  }

  onSubmit(AdressType type) async {
    int addressType;
    if (type == AdressType.permanent) {
      addressType = 1;
    } else {
      addressType = 0;
    }
    isLoading.value = true;
    if (formKey.currentState!.validate()) {
      int? pincode = int.tryParse(pincodeController.text);
      int? age = int.tryParse(ageController.text);
      if (pincode == null) {
        Get.snackbar('Error', 'Pincode must be a number');
        isLoading.value = false;
        return;
      }
      if (age == null) {
        Get.snackbar('Error', 'Age must be a number');
        isLoading.value = false;
        return;
      }
      AddressModel model = AddressModel(
        address: addressController.text.trim(),
        city: cityController.text.trim(),
        pincode: pincode.toString(),
        name: nameController.text.trim(),
        age: age.toString(),
      );
      final result = await ApiSettings().addAddress(model);
      isLoading.value = false;
      if (result != null) {
        if (result.address != null) {
          print(result.address);
          addAdresstoDB(result, addressType);
        } else {
          print(result.message);
          ErrorDialoge.showSnakBar(result.message!);
        }
      } else {
        ErrorDialoge.showSnakBar("No Network");
      }
    }
    isLoading.value = false;
  }

  static Future<void> initializeDataBase() async {
    _database = await openDatabase('addressDB.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE useraddress (id INTEGER PRIMARY KEY, name TEXT, age TEXT, address TEXT, city TEXT, pincode TEXT,type INTEGER)');
    });
  }

  getAllAddress() async {
    final value = await _database.rawQuery('SELECT * FROM useraddress');
    addressList.clear();
    for (var map in value) {
      final adrs = AddressModel.fromMap(map);
      print(map);
      addressList.add(adrs);
    }
    check();
    update();
  }

  addAdresstoDB(AddressModel model, int type) async {
    await getAllAddress();
    if (addressList.isEmpty) {
      addToDb(model, type);
    } else if (addressList.length == 1 && type == 1) {
      await deleteDB(type);
      await addToDb(model, type);
    } else if (addressList.length == 1 && type == 0) {
      addToDb(model, type);
    } else {
      await deleteDB(type);
      await addToDb(model, type);
    }

    getAllAddress();
  }

  addToDb(AddressModel model, int type) async {
    await _database.rawInsert(
        'INSERT INTO useraddress (id,name,age,address,city,pincode,type) VALUES(?,?,?,?,?,?,?)',
        [
          model.id,
          model.name,
          model.age,
          model.address,
          model.city,
          model.pincode,
          type,
        ]);
    print('added --->${model.id}');
  }

  deleteDB(int type) async {
    final int id;
    if (type == 1) {
      id = permanentAddress!.id!;
    } else {
      id = temporaryAddress!.id!;
    }
    await _database.rawDelete('DELETE FROM useraddress WHERE id = ?', [id]);
  }

  check() {
    if (addressList.isNotEmpty) {
      if (addressList.length == 2) {
        if (addressList[0].type == 1) {
          permanentAddress = addressList[0];
          temporaryAddress = addressList[1];
          return;
        } else {
          permanentAddress = addressList[1];
          temporaryAddress = addressList[0];
          return;
        }
      }
      permanentAddress = addressList[0];
      return;
    }
  }

  setPermenent() {
    if (permanentAddress == null) {
      print('empty permenet');
      clearControllers();
      return;
    }
    nameController = TextEditingController(text: permanentAddress!.name);
    addressController = TextEditingController(text: permanentAddress!.address!);
    ageController = TextEditingController(text: permanentAddress!.age!);
    pincodeController = TextEditingController(text: permanentAddress!.pincode!);
    cityController = TextEditingController(text: permanentAddress!.city!);
    update();
  }

  setTempAdd() {
    if (temporaryAddress == null) {
      clearControllers();
      return;
    }
    nameController = TextEditingController(text: temporaryAddress!.name);
    addressController = TextEditingController(text: temporaryAddress!.address!);
    ageController = TextEditingController(text: temporaryAddress!.age!);
    pincodeController = TextEditingController(text: temporaryAddress!.pincode!);
    cityController = TextEditingController(text: temporaryAddress!.city!);
  }

  clearControllers() {
    nameController.clear();
    addressController.clear();
    ageController.clear();
    pincodeController.clear();
    cityController.clear();
  }
}
