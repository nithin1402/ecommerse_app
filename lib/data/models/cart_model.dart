class CartModel {
  final bool status;
  final String message;
  final List<CartDataModel> data;

  CartModel({required this.status, required this.message, required this.data});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      status: json["status"] ?? false,
      message: json["message"] ?? "",
      data: List<CartDataModel>.from(
        (json["data"] ?? []).map((e) => CartDataModel.fromJson(e)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "data": data.map((e) => e.toJson()).toList(),
    };
  }
}

class CartDataModel {
  final int id;
  final int productId;
  final String name;
  final String price;
  int quantity;
  final String image;

  CartDataModel({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
  });

  factory CartDataModel.fromJson(Map<String, dynamic> json) {
    return CartDataModel(
      id: json["id"] ?? 0,
      productId: json["product_id"] ?? 0,
      name: json["name"] ?? "",
      price: json["price"]?.toString() ?? "0",
      quantity: json["quantity"] ?? 1,
      image: json["image"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "product_id": productId,
      "name": name,
      "price": price,
      "quantity": quantity,
      "image": image,
    };
  }
}
