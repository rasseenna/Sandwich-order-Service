class OrderModel {
  List<Result>? result;
  String? message;
  String? status;
  int? totalPrice;

  OrderModel({this.result, this.message, this.status, this.totalPrice});

  OrderModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    data['total_price'] = this.totalPrice;
    return data;
  }
}

class Result {
  String? id;
  String? name;
  String? description;
  String? price;
  String? image;
  String? category;

  Result(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.image,
      this.category});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['category'] = this.category;
    return data;
  }
}