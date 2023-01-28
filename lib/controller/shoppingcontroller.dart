import 'package:flutter/material.dart';
import 'package:flutter_getx/model/product.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ShoppingController extends GetxController {
  // product 타입의 리스트 선언, 리스트 관련 데이터를  UI에 바인드 하려는 것이므로 이것을 observable로 만들어주면 된다.
  // obs로 바꿔주면 데이터가 바뀔때마다 UI가 자동으로 업데이트 된다.
  var products = <Product>[].obs;

  //컨트롤러가 생성될 때 호출되는 메소드(oninit)를 사용하여 원하는 명령을 컨트롤러가 생성될 때 실행가능
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    // api call을 하는 상황을 가정하여 2초후에 데이터를 전달
    await Future.delayed(const Duration(seconds: 2));
    var productData = [
      Product(
          id: 1,
          productName: 'Mouse',
          productDescription: 'some description about product',
          price: 30),
      Product(
          id: 2,
          productName: 'Knife',
          productDescription: 'some description about product',
          price: 50),
      Product(
          id: 3,
          productName: 'bat',
          productDescription: 'some description about product',
          price: 100),
      Product(
          id: 4,
          productName: 'Sword',
          productDescription: 'some description about product',
          price: 170),
      Product(
          id: 5,
          productName: 'milk',
          productDescription: 'some description about product',
          price: 20),
    ];

    // 프로덕트를 불러오면 assignAll을 불러올 수 있는데 여기에 productData를 전달해 주면 된다.
    products.assignAll(productData);
  }
}
