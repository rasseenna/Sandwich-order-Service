import 'package:get/get.dart';

import '../constants/api_constants.dart';
import '../model/orderProductmodel.dart';
import '../services/api_services.dart';
import '../views/nonadmin/order_history.dart';
import '../widgets/snackbars.dart';

class NonAdminController extends GetxController {
  RxList<Result> orderlist = <Result>[].obs;
  RxBool addressSubmitLoading = false.obs;
  RxBool isLoading = false.obs;
  RxString sandwichId = "".obs;
  RxString drinkId = "".obs;
  RxString snackId = "".obs;
  RxString receiptNumber = "".obs;
  var order = OrderModel();

  APIservices apiProvider = APIservices();
  Future OrderPlace() async {
    var params = {
      "sandwichId": sandwichId.value,
      "snackId": snackId.value,
      "drinkId": drinkId.value
    };
    final response = await apiProvider.apiClient(OrderproductsUrl, params);
    return response;
  }

  void orderProducts() async {
    isLoading.value = true;
    var response = OrderPlace();
    response.then((value) {
      try {
        if (value["status"] == "true") {
          isLoading.value = false;
          order = OrderModel.fromJson(value);
          orderlist.value = order.result!;
        } else {
          showErrorSnackBar('Error', value['message']);
        }
      } catch (e) {
        print(e.toString());
      }
    }, onError: (e) {
      showErrorSnackBar("Failed", e.toString());
    });
  }

  void submitAddress({String? name, String? deliveryAddress}) async {
    Future addressSubmit() async {
      var params = {
        "customer_name": name.toString(),
        "delivery_address": deliveryAddress.toString(),
        "total_price": order.totalPrice.toString(),
        "sandwichId": sandwichId.value,
        "snackId": snackId.value,
        "drinkId": drinkId.value
      };
      final response = await apiProvider.apiClient(orderSaveUrl, params);
      return response;
    }

    var response = addressSubmit();
    response.then((value) {
      try {
        print("api calling");
        if (value["status"] == "true") {
          receiptNumber.value = value["receipt_number"];
          Get.to(OrderHistory());
        } else {
          showErrorSnackBar('Error', value['message']);
        }
      } catch (e) {
        print(e.toString());
      }
    }, onError: (e) {
      showErrorSnackBar("Failed", e.toString());
    });
  }
}
