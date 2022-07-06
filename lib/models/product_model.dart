class Product {
  String? id;
  String? name;
  String? detail;
  String? price;
  String? discountPrice;
  String? brand;
  String? serialCode;
  bool? isOnSale;
  bool? isPopular;
  bool? isFavourite;
  List<dynamic>? images;
  Product(
      {this.id,
      this.name,
      this.detail,
      this.price,
      this.discountPrice,
      this.brand,
      this.serialCode,
      this.isOnSale,
      this.isPopular,
      this.isFavourite,
      this.images});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    detail = json['detail'];
    price = json['price'];
    discountPrice = json['discountPrice'];
    brand = json['brand'];
    serialCode = json['serialCode'];
    isOnSale = json['isOnSale'];
    isPopular = json['isPop'];
    name = json['name'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toMap() {
    var data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
