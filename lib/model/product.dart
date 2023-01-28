class Product {
  // 4가지 요소 지정
  final int id;
  final String productName;
  final String productDescription;
  final double price;

  // 각 데이터를 입력받을 생성자
  Product({
    required this.id,
    required this.productName,
    required this.productDescription,
    required this.price,
  });
}
