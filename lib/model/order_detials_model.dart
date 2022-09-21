class OrderDetailsModel {
  Order? order;

  OrderDetailsModel({this.order});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Order {
  int? id;
  String? orderNumber;
  String? orderKey;
  String? createdAt;
  String? updatedAt;
  String? completedAt;
  String? status;
  String? currency;
  String? total;
  String? subtotal;
  int? totalLineItemsQuantity;
  String? totalTax;
  String? totalShipping;
  String? cartTax;
  String? shippingTax;
  String? totalDiscount;
  String? shippingMethods;
  PaymentDetails? paymentDetails;
  BillingAddress? billingAddress;
  ShippingAddress? shippingAddress;
  String? note;
  String? customerIp;
  String? customerUserAgent;
  int? customerId;
  String? viewOrderUrl;
  List<LineItems>? lineItems;
  // List<Null>? shippingLines;
  // List<Null>? taxLines;
  // List<Null>? feeLines;
  // List<Null>? couponLines;
  Customer? customer;

  Order(
      {this.id,
        this.orderNumber,
        this.orderKey,
        this.createdAt,
        this.updatedAt,
        this.completedAt,
        this.status,
        this.currency,
        this.total,
        this.subtotal,
        this.totalLineItemsQuantity,
        this.totalTax,
        this.totalShipping,
        this.cartTax,
        this.shippingTax,
        this.totalDiscount,
        this.shippingMethods,
        this.paymentDetails,
        this.billingAddress,
        this.shippingAddress,
        this.note,
        this.customerIp,
        this.customerUserAgent,
        this.customerId,
        this.viewOrderUrl,
        this.lineItems,
        // this.shippingLines,
        // this.taxLines,
        // this.feeLines,
        // this.couponLines,
        this.customer});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    orderKey = json['order_key'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    completedAt = json['completed_at'];
    status = json['status'];
    currency = json['currency'];
    total = json['total'];
    subtotal = json['subtotal'];
    totalLineItemsQuantity = json['total_line_items_quantity'];
    totalTax = json['total_tax'];
    totalShipping = json['total_shipping'];
    cartTax = json['cart_tax'];
    shippingTax = json['shipping_tax'];
    totalDiscount = json['total_discount'];
    shippingMethods = json['shipping_methods'];
    paymentDetails = json['payment_details'] != null
        ? new PaymentDetails.fromJson(json['payment_details'])
        : null;
    billingAddress = json['billing_address'] != null
        ? new BillingAddress.fromJson(json['billing_address'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ? new ShippingAddress.fromJson(json['shipping_address'])
        : null;
    note = json['note'];
    customerIp = json['customer_ip'];
    customerUserAgent = json['customer_user_agent'];
    customerId = json['customer_id'];
    viewOrderUrl = json['view_order_url'];
    if (json['line_items'] != null) {
      lineItems = <LineItems>[];
      json['line_items'].forEach((v) {
        lineItems!.add(new LineItems.fromJson(v));
      });
    }
    // if (json['shipping_lines'] != null) {
    //   shippingLines = <Null>[];
    //   json['shipping_lines'].forEach((v) {
    //     shippingLines!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['tax_lines'] != null) {
    //   taxLines = <Null>[];
    //   json['tax_lines'].forEach((v) {
    //     taxLines!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['fee_lines'] != null) {
    //   feeLines = <Null>[];
    //   json['fee_lines'].forEach((v) {
    //     feeLines!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['coupon_lines'] != null) {
    //   couponLines = <Null>[];
    //   json['coupon_lines'].forEach((v) {
    //     couponLines!.add(new Null.fromJson(v));
    //   });
    // }
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_number'] = this.orderNumber;
    data['order_key'] = this.orderKey;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['completed_at'] = this.completedAt;
    data['status'] = this.status;
    data['currency'] = this.currency;
    data['total'] = this.total;
    data['subtotal'] = this.subtotal;
    data['total_line_items_quantity'] = this.totalLineItemsQuantity;
    data['total_tax'] = this.totalTax;
    data['total_shipping'] = this.totalShipping;
    data['cart_tax'] = this.cartTax;
    data['shipping_tax'] = this.shippingTax;
    data['total_discount'] = this.totalDiscount;
    data['shipping_methods'] = this.shippingMethods;
    if (this.paymentDetails != null) {
      data['payment_details'] = this.paymentDetails!.toJson();
    }
    if (this.billingAddress != null) {
      data['billing_address'] = this.billingAddress!.toJson();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    data['note'] = this.note;
    data['customer_ip'] = this.customerIp;
    data['customer_user_agent'] = this.customerUserAgent;
    data['customer_id'] = this.customerId;
    data['view_order_url'] = this.viewOrderUrl;
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems!.map((v) => v.toJson()).toList();
    }
    // if (this.shippingLines != null) {
    //   data['shipping_lines'] =
    //       this.shippingLines!.map((v) => v.toJson()).toList();
    // }
    // if (this.taxLines != null) {
    //   data['tax_lines'] = this.taxLines!.map((v) => v.toJson()).toList();
    // }
    // if (this.feeLines != null) {
    //   data['fee_lines'] = this.feeLines!.map((v) => v.toJson()).toList();
    // }
    // if (this.couponLines != null) {
    //   data['coupon_lines'] = this.couponLines!.map((v) => v.toJson()).toList();
    // }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class PaymentDetails {
  String? methodId;
  String? methodTitle;
  bool? paid;

  PaymentDetails({this.methodId, this.methodTitle, this.paid});

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    methodId = json['method_id'];
    methodTitle = json['method_title'];
    paid = json['paid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method_id'] = this.methodId;
    data['method_title'] = this.methodTitle;
    data['paid'] = this.paid;
    return data;
  }
}

class BillingAddress {
  String? firstName;
  String? lastName;
  String? company;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postcode;
  String? country;
  String? email;
  String? phone;

  BillingAddress(
      {this.firstName,
        this.lastName,
        this.company,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.postcode,
        this.country,
        this.email,
        this.phone});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['company'] = this.company;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postcode'] = this.postcode;
    data['country'] = this.country;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class ShippingAddress {
  String? firstName;
  String? lastName;
  String? company;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postcode;
  String? country;

  ShippingAddress(
      {this.firstName,
        this.lastName,
        this.company,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.postcode,
        this.country});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['company'] = this.company;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postcode'] = this.postcode;
    data['country'] = this.country;
    return data;
  }
}

class LineItems {
  int? id;
  String? subtotal;
  String? subtotalTax;
  String? total;
  String? totalTax;
  String? price;
  int? quantity;
  String? taxClass;
  String? name;
  int? productId;
  String? sku;
  List<Null>? meta;

  LineItems(
      {this.id,
        this.subtotal,
        this.subtotalTax,
        this.total,
        this.totalTax,
        this.price,
        this.quantity,
        this.taxClass,
        this.name,
        this.productId,
        this.sku,
        this.meta});

  LineItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subtotal = json['subtotal'];
    subtotalTax = json['subtotal_tax'];
    total = json['total'];
    totalTax = json['total_tax'];
    price = json['price'];
    quantity = json['quantity'];
    taxClass = json['tax_class'];
    name = json['name'];
    productId = json['product_id'];
    sku = json['sku'];
    // if (json['meta'] != null) {
    //   meta = <Null>[];
    //   json['meta'].forEach((v) {
    //     meta!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subtotal'] = this.subtotal;
    data['subtotal_tax'] = this.subtotalTax;
    data['total'] = this.total;
    data['total_tax'] = this.totalTax;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['tax_class'] = this.taxClass;
    data['name'] = this.name;
    data['product_id'] = this.productId;
    data['sku'] = this.sku;
    // if (this.meta != null) {
    //   data['meta'] = this.meta!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Customer {
  int? id;
  String? createdAt;
  String? lastUpdate;
  String? email;
  String? firstName;
  String? lastName;
  String? username;
  String? role;
  int? lastOrderId;
  String? lastOrderDate;
  int? ordersCount;
  String? totalSpent;
  String? avatarUrl;
  BillingAddress? billingAddress;
  ShippingAddress? shippingAddress;

  Customer(
      {this.id,
        this.createdAt,
        this.lastUpdate,
        this.email,
        this.firstName,
        this.lastName,
        this.username,
        this.role,
        this.lastOrderId,
        this.lastOrderDate,
        this.ordersCount,
        this.totalSpent,
        this.avatarUrl,
        this.billingAddress,
        this.shippingAddress});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    lastUpdate = json['last_update'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    role = json['role'];
    lastOrderId = json['last_order_id'];
    lastOrderDate = json['last_order_date'];
    ordersCount = json['orders_count'];
    totalSpent = json['total_spent'];
    avatarUrl = json['avatar_url'];
    billingAddress = json['billing_address'] != null
        ? new BillingAddress.fromJson(json['billing_address'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ? new ShippingAddress.fromJson(json['shipping_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['last_update'] = this.lastUpdate;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['role'] = this.role;
    data['last_order_id'] = this.lastOrderId;
    data['last_order_date'] = this.lastOrderDate;
    data['orders_count'] = this.ordersCount;
    data['total_spent'] = this.totalSpent;
    data['avatar_url'] = this.avatarUrl;
    if (this.billingAddress != null) {
      data['billing_address'] = this.billingAddress!.toJson();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    return data;
  }
}
