class shoes {
  String model;
  double currentPrice, oldPrice;
  List<String> prodImages;
  int model_num;
  shoes({
    required this.model,
    required this.model_num,
    required this.oldPrice,
    required this.currentPrice,
    required this.prodImages,
  });
}

List<shoes> shoesItem = [
  shoes(
      model: 'Nike shoes1 ',
      model_num: 10,
      oldPrice: 20,
      currentPrice: 30,
      prodImages: [
        'assets/images/shoes1_1.png',
        'assets/images/shoes1_2.png',
        'assets/images/shoes1_3.png'
      ]),
  shoes(
      model: 'Nike shoes2 ',
      model_num: 10,
      oldPrice: 20,
      currentPrice: 30,
      prodImages: [
        'assets/images/shoes2_1.png',
        'assets/images/shoes2_2.png',
        'assets/images/shoes2_3.png'
      ]),
  shoes(
      model: 'Nike shoes3 ',
      model_num: 10,
      oldPrice: 20,
      currentPrice: 30,
      prodImages: [
        'assets/images/shoes3_1.png',
        'assets/images/shoes3_2.png',
        'assets/images/shoes3_3.png'
      ]),
  shoes(
      model: 'Nike shoes4 ',
      model_num: 10,
      oldPrice: 20,
      currentPrice: 30,
      prodImages: [
        'assets/images/shoes4_1.png',
        'assets/images/shoes4_1.png',
        'assets/images/shoes1_3.png'
      ]),
  shoes(
      model: 'Nike shoes5 ',
      model_num: 10,
      oldPrice: 20,
      currentPrice: 30,
      prodImages: [
        'assets/images/shoes5_1.png',
        'assets/images/shoes5_1.png',
        'assets/images/shoes1_3.png'
      ]),
  shoes(
      model: 'Nike shoes6 ',
      model_num: 10,
      oldPrice: 20,
      currentPrice: 30,
      prodImages: [
        'assets/images/shoes6_1.png',
        'assets/images/shoes6_1.png',
        'assets/images/shoes1_3.png'
      ]),shoes(
      model: 'Nike shoes6 ',
      model_num: 10,
      oldPrice: 20,
      currentPrice: 30,
      prodImages: [
        'assets/images/shoes7_1.png',
        'assets/images/shoes7_1.png',
        'assets/images/shoes1_3.png'
      ]),
];
