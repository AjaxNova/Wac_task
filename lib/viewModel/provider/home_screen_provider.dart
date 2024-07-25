import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:wac_machine_test/constatns/constants.dart';
import 'package:wac_machine_test/model/product_model.dart';

class HomeScreenProvider extends ChangeNotifier {
  int currentBottomIndex = 0;

  List<String>? bannerImageList = [];

  List<Content> bestSellerProdcuts = [];
  List<Content> mostpopularproducts = [];

  List<ProductModel> singleBanner = [];

  List<ProductModel> categories = [];

  bool isLoading = true;
  changeBottomIndex(int index) {
    currentBottomIndex = index;
    notifyListeners();
  }

  turnLoadingOff() {
    isLoading = false;
    notifyListeners();
  }

  turnLoadingOn() {
    isLoading = true;
    notifyListeners();
  }

  fetchFromApi({required BuildContext context}) async {
    log("Function called");
    // turnLoadingOn();
    try {
      final data = await http.get(
          Uri.parse("https://64bfc2a60d8e251fd111630f.mockapi.io/api/Todo"));
      if (data.statusCode == 200) {
        List<ProductModel> allList = productModelFromMap(data.body);
        for (var i = 0; i < allList.length; i++) {
          log(allList[i].type);
          if (allList[i].type == "banner_slider") {
            for (var j = 0; j < allList[i].contents!.length; j++) {
              bannerImageList!.add(allList[i].contents![j].imageUrl!);
            }
          } else if (allList[i].type == "products" &&
              allList[i].title == "Best Sellers") {
            bestSellerProdcuts.addAll(allList[i].contents!.toList());
          } else if (allList[i].type == "banner_single") {
            singleBanner.add(allList[i]);
          } else if (allList[i].type == "catagories") {
            categories.add(allList[i]);
          } else if (allList[i].type == "products" &&
              allList[i].title == "Most Popular") {
            mostpopularproducts.addAll(allList[i].contents!.toList());
          }
        }

        notifyListeners();
        // setValueToAllModel(allList);
        turnLoadingOff();
      } else {
        showErrorDialog(context);
      }
    } catch (e) {
      showErrorDialog(context);
      log(e.toString());
    }
  }
}
