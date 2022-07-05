class Order {
  Order({
    required this.id,
    required this.link,
    required this.price,
    required this.tax,
    required this.timeOffer,
    required this.shipping,
    required this.size,
    required this.notes,
    required this.status,
    required this.createdAt,
    required this.since,
    required this.total,
    required this.qty,
    required this.color,
    required this.imageOrder,
  });
  late final int id;
  late final String link;
  late final String price;
  late final String tax;
  late final String timeOffer;
  late final String shipping;
  late final String size;
  late final String notes;
  late final Status status;
  late final String createdAt;
  late final String since;
  late final String total;
  late final int qty;
  late final String color;
  late final String deliveryTime;
  late final String deliveryId;

  late final String imageOrder;

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    price = json['price'];
    tax = json['tax'];
    timeOffer = json['time_offer'];
    shipping = json['shipping'];
    size = json['size'];
    notes = json['notes'];
    status = Status.fromJson(json['status']);
    createdAt = json['created_at'];
    since = json['since'];
    total = json['total'];
    qty = json['qty'];
    color = json['color'];
    deliveryTime = json['delivery_time'];
    deliveryId = json['delivery_id'];
    imageOrder = json['image_order'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['link'] = link;
    _data['price'] = price;
    _data['tax'] = tax;
    _data['commission'] = timeOffer;
    _data['shipping'] = shipping;
    _data['size'] = size;
    _data['notes'] = notes;
    _data['status'] = status.toJson();
    _data['created_at'] = createdAt;
    _data['since'] = since;
    _data['total'] = total;
    _data['qty'] = qty;

    return _data;
  }
}

class Status {
  Status({
    required this.id,
    required this.name,
    required this.color,
  });
  late final int id;
  late final String name;
  late final String color;

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['color'] = color;
    return _data;
  }
}
