/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "66ef8b119f1cf02bbb68beaa"
/// data : {"_id":"66ef8b119f1cf02bbb68beaa","cartOwner":"66ef8aa29f1cf02bbb68be8d","products":[{"count":1,"_id":"66ef8b119f1cf02bbb68beab","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2024-09-22T03:12:17.766Z","updatedAt":"2024-09-22T03:12:17.944Z","__v":0,"totalCartPrice":149}

class Addcartresponse {
  Addcartresponse({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.statusMsg,
    this.data,
  });

  Addcartresponse.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];

    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddDataCart.fromJson(json['data']) : null;
  }

  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  AddDataCart? data;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    map['cartId'] = cartId;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// _id : "66ef8b119f1cf02bbb68beaa"
/// cartOwner : "66ef8aa29f1cf02bbb68be8d"
/// products : [{"count":1,"_id":"66ef8b119f1cf02bbb68beab","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2024-09-22T03:12:17.766Z"
/// updatedAt : "2024-09-22T03:12:17.944Z"
/// __v : 0
/// totalCartPrice : 149

class AddDataCart {
  AddDataCart({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  AddDataCart.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProduct.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  String? id;
  String? cartOwner;
  List<AddProduct>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }
}

/// count : 1
/// _id : "66ef8b119f1cf02bbb68beab"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

class AddProduct {
  AddProduct({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  AddProduct.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }

  num? count;
  String? id;
  String? product;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }
}
