
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class RatingController extends GetxController {
  int currentRating = 0;
  final box = GetStorage();

  @override
  void onInit() { // called whenever we initialize the controller
    super.onInit();
    currentRating = box.read('rating') ?? 0; // initializing current rating from storage or 0 if storage is null
  }

  void updateAndStoreRating(int rating) {
    currentRating = rating;
    box.write('rating', rating); // stores to local database
    update(); // triggers a rebuild of the GetBuilder Widget
  }

  Widget buildRatingStar(int index) {
    if (index < currentRating) {
      return Icon(
        Icons.star,
        color: Colors.yellow,
      );
    } else {
      return Icon(
        Icons.star,
        color: Colors.white,
      );
    }
  }
}