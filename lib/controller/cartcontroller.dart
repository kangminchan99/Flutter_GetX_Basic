import 'package:flutter_getx/model/product.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartController extends GetxController {
  // RxInt count = 0.obs;
  var cartItems = <Product>[].obs;

  // T fold<T>(T initialValue, T Function(T, int) combine)
  // fold메소드는 input parameter들을 가지고 있는데, 첫번째는 타입 T로부터 이니셜 밸류를 가지고 있고,
  // 두번째로는 Function을 가지고있다. 이 Funtion은 두개의 파라미터를 가지고 있는데, 첫번째는 타입 T에서 오는 것이고,
  // 두번째는 리스트 타입에 따라 달라진다.
  // 0 = initialValue값, int 타입의 e와 item를 인자값으로 주고 그 값들을 더해주기, price는 product에서 온 것임
  double get totalPrice => cartItems.fold(0, (e, item) => e + item.price);
  int get count => cartItems.length;

  // 인자값으로 Product타입의 product를 전달
  void addItem(Product product) {
    // add메서드를 불러와서 product로 전달
    cartItems.add(product);
  }
}
