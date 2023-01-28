import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/controller/cartcontroller.dart';
import 'package:flutter_getx/controller/shoppingcontroller.dart';
import 'package:get/get.dart';

// GetX에서는 원하는 어떤 데이터이던지 삽입 가능하기 때문에 StatelessWidget을 사용해도 된다.
class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});

  // 컨트롤러를 디펜던시 인젝션
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // Column 위젯 안에서 ListView위젯을 불러왔을 때 반드시 Expanded위젯으로 감싸주어야 정상적으로 출력된다.
      body: Column(
        children: [
          Expanded(
            // ListView는 끊임없이 ShoppingController를 listen하고 있다가, 데이터가 바뀌면 그 즉시 데이터를 업데이트해준다.
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                // controller를 사용해 모든 데이터 정보를 가져온다.
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            // 양쪽으로 같은 거리에 요소들이 배치
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // 텍스트 위젯에 productName를 업데이트
                                    controller.products[index].productName,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  // 텍스트 위젯에 productDescription를 업데이트
                                  Text(controller
                                      .products[index].productDescription)
                                ],
                              ),
                              // 텍스트 위젯에 price를 업데이트
                              Text(
                                '\$ ${controller.products[index].price}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              cartController
                                  .addItem(controller.products[index]);
                            },
                            child: const Text('Add to cart'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          const SizedBox(
            height: 30,
          ),
          GetX<CartController>(builder: (controller) {
            return Text(
              'Total amount: \$ ${controller.totalPrice}',
              style: const TextStyle(fontSize: 25, color: Colors.white),
            );
          }),
          const SizedBox(
            height: 100,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(builder: (controller) {
          return Text(
            cartController.count.toString(),
            style: const TextStyle(fontSize: 20),
          );
        }),
        icon: const Icon(Icons.add_shopping_cart_rounded),
      ),
    );
  }
}
