class Order {
  List<DataOrder>? data;
  Meta? meta;


  Order({ this.data,this.meta});
  static Order fromJson(Map<String, dynamic> json) {
    return Order(
        data:json['data']!=null? List<DataOrder>.from(
          json["data"].map((i) => DataOrder.fromJson(i)),
        ):null,
      meta: json['meta']!= null ? Meta.fromJson(json["meta"]):null
        );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    if(meta != null){
      data['meta']=meta;
    }

    return data;
  }
}

class DataOrder {
  String id;
  String ref;
  int vat;
  int total;
  String? notes;
  int status;
  String statusNew;
  List<dynamic> tags;
  String? extraFields;
  List<dynamic> customFields;
  bool isRefundedByPlatform;
  num platformFee;
  StatusObject? statusObject;
  int paymentStatus;
  String paymentStatusNew;
  String createdAt;
  String updatedAt;
  Links? links;
  Payment? payment;
  Shipping? shipping;
  List<Variants>? variants;

  DataOrder({
    required this.id,
    required this.ref,
    required this.vat,
    required this.total,
    this.notes,
    required this.status,
    required this.statusNew,
    required this.tags,
    this.extraFields,
    required this.customFields,
    required this.isRefundedByPlatform,
    required this.platformFee,
    this.statusObject,
    required this.paymentStatus,
    required this.paymentStatusNew,
    required this.createdAt,
    required this.updatedAt,
    this.links,
    this.payment,
    this.shipping,
     this.variants
  });

  static DataOrder fromJson(Map<String, dynamic> json) {
    return DataOrder(
      id: json['id'],
      ref: json['ref'],
      vat: json['vat'],
      total: json['total'],
      notes: json['notes'],
      status: json['status'],
      statusNew: json['status_new'],
      tags: json['tags'] ?? [],
      extraFields: json['extra_fields'],
      customFields: json['custom_fields'] ?? [],
      isRefundedByPlatform: json['is_refunded_by_platform'],
      platformFee: json['platform_fee'],
      statusObject: json['status_object'] != null
          ? StatusObject.fromJson(json['status_object'])
          : null,
      paymentStatus: json['payment_status'],
      paymentStatusNew: json['payment_status_new'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
      payment:
          json['payment'] != null ? Payment.fromJson(json['payment']) : null,
      shipping:
          json['shipping'] != null ? Shipping.fromJson(json['shipping']) : null,
      variants:List<Variants>.from(
    json["variants"].map((i) => Variants.fromJson(i))),
  );}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id']=id;
    data['ref']=ref;
    data['vat']=vat;
    data['total']=total;
    data['notes']=notes;
    data['status']=status;
    data['status_new'] = statusNew;
    data['tags'] = tags.map((v) => v).toList();
    data['extra_fields'] = extraFields;
    data['custom_fields'] = customFields.map((v) => v).toList();
    data['is_refunded_by_platform'] = isRefundedByPlatform;
    data['platform_fee'] = platformFee;
    if (statusObject != null) {
      data['status_object'] = statusObject;
    }
    data['payment_status'] = paymentStatus;
    data['payment_status_new'] = paymentStatusNew;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (links != null) {
      data['links'] = links;
    }
    if (payment != null) {
      data['payment'] = payment;
    }
    if (shipping != null) {
      data['shipping'] = shipping;
    }

    return data;
  }
}

class StatusObject {
  String slug;
  String name;
  String color;

  StatusObject({required this.slug, required this.name, required this.color});
  static StatusObject fromJson(Map<String, dynamic> json) {
    return StatusObject(
      slug: json['slug'],
      name: json['name'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slug'] = slug;
    data['name'] = name;
    data['color'] = color;
    return data;
  }
}

class Links {
  String show;

  Links({required this.show});
  static Links fromJson(Map<String, dynamic> json) {
    return Links(
      show: json['show'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['show'] = show;
    return data;
  }
}

class Payment {
  String statusText;
  StatusObject? statusObject;
  int status;
  String createdAt;
  String updatedAt;

  Payment(
      {required this.statusText,
      required this.statusObject,
      required this.status,
      required this.createdAt,
      required this.updatedAt});
  static Payment fromJson(Map<String, dynamic> json) {
    return Payment(
      statusText: json['status_text'],
      statusObject: json['status_object'] != null
          ? StatusObject.fromJson(json['status_object'])
          : null,
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_text'] = statusText;
    if (statusObject != null) {
      data['status_object'] = statusObject;
    }
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Shipping {
  String statusText;
  StatusObject? statusObject;
  int status;
  int price;
  bool isFree;
  String? trackingNumber;
  String createdAt;
  String updatedAt;

  Shipping(
      {required this.statusText,
      this.statusObject,
      required this.status,
      required this.price,
      required this.isFree,
      this.trackingNumber,
      required this.createdAt,
      required this.updatedAt});
  static Shipping fromJson(Map<String, dynamic> json) {
    return Shipping(
      statusText: json['status_text'],
      statusObject: json['status_object'] != null
          ? StatusObject.fromJson(json['status_object'])
          : null,
      status: json['status'],
      price: json['price'],
      isFree: json['is_free'],
      trackingNumber: json['tracking_number'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_text'] = statusText;
    if (statusObject != null) {
      data['status_object'] = statusObject;
    }
    data['status'] = status;
    data['price'] = price;
    data['is_free'] = isFree;
    data['tracking_number'] = trackingNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Variants {
  String id;
  int price;
  int quantity;
  int createdAt;
  int updatedAt;
  List<dynamic> extraFields;
  Variant? variant;

  Variants(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.createdAt,
      required this.updatedAt,
      required this.extraFields,
      this.variant});

  static Variants fromJson(Map<String, dynamic> json) {
    return Variants(
        id: json['id'],
        price: json['price'],
        quantity: json['quantity'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        extraFields: json['extra_fields'] ?? [],
        variant:
            json['variant'] != null ? Variant.fromJson(json['variant']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.extraFields != null) {
      data['extra_fields'] = this.extraFields?.map((v) => v).toList();
    }
    if (this.variant != null) {
      data['variant'] = this.variant;
    }
    return data;
  }
}

class Variant {
  String id;
  Variations? variations;
  List<String> options;
  List<String> values;
  int price;
  String? compareAtPrice;
  int weight;
  String? sku;
  String? barcode;
  int inventory;
  bool isSelected;
  bool isDefault;
  ImageVariant? image;
  String createdAt;
  String updatedAt;
  Product? product;

  Variant(
      {required this.id,
      this.variations,
      required this.options,
      required this.values,
      required this.price,
      this.compareAtPrice,
      required this.weight,
      this.sku,
      this.barcode,
      required this.inventory,
      required this.isSelected,
      required this.isDefault,
      this.image,
      required this.createdAt,
      required this.updatedAt,
      this.product});

  static Variant fromJson(Map<String, dynamic> json) {
    return Variant(
      id: json['id'],
      variations: json['variations'] != null
          ? Variations.fromJson(json['variations'])
          : null,
      options: json['options'].cast<String>(),
      values: json['values'].cast<String>(),
      price: json['price'],
      compareAtPrice: json['compare_at_price'],
      weight: json['weight'],
      sku: json['sku'],
      barcode: json['barcode'],
      inventory: json['inventory'],
      isSelected: json['is_selected'],
      isDefault: json['is_default'],
      image:
          json['image'] != null ? ImageVariant.fromJson(json['image']) : null,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      product:
          json['product'] != null ? Product.fromJson(json['product']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.variations != null) {
      data['variations'] = this.variations;
    }
    data['options'] = this.options;
    data['values'] = this.values;
    data['price'] = this.price;
    data['compare_at_price'] = this.compareAtPrice;
    data['weight'] = this.weight;
    data['sku'] = this.sku;
    data['barcode'] = this.barcode;
    data['inventory'] = this.inventory;
    data['is_selected'] = this.isSelected;
    data['is_default'] = this.isDefault;
    if (this.image != null) {
      data['image'] = this.image;
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product;
    }
    return data;
  }
}

class Variations {
  String defaults;

  Variations({required this.defaults});
  static Variations fromJson(Map<String, dynamic> json) {
    return Variations(defaults: json['default']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['default'] = defaults;
    return data;
  }
}

class ImageVariant {
  String? name;
  String? url;

  ImageVariant({this.name, this.url});
  static ImageVariant fromJson(Map<String, dynamic> json) {
    return ImageVariant(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Product {
  String id;
  String name;
  String slug;
  String? publicUrl;
  String thumbnail;
  String description;
  int price;
  int? compareAtPrice;
  int? costPrice;
  bool visibility;
  bool hasVariants;
  int variantsCount;
  List<dynamic> variantOptions;
  int inventory;
  bool trackInventory;
  int youSaveAmount;
  MetaIn? meta;
  AdvancedOptions? advancedOptions;
  String createdAt;
  String updatedAt;
  bool deletedAt;
  bool hasRelatedProducts;
  List<dynamic> relatedProducts;
  List<Images>? images;

  Product(
      {required this.id,
      required this.name,
      required this.slug,
      this.publicUrl,
      required this.thumbnail,
      required this.description,
      required this.price,
      this.compareAtPrice,
      this.costPrice,
      required this.visibility,
      required this.hasVariants,
      required this.variantsCount,
      required this.variantOptions,
      required this.inventory,
      required this.trackInventory,
      required this.youSaveAmount,
      this.meta,
      this.advancedOptions,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt,
      required this.hasRelatedProducts,
      required this.relatedProducts,
      this.images});
  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      publicUrl: json['public_url'],
      thumbnail: json['thumbnail'],
      description: json['description'],
      price: json['price'],
      compareAtPrice: json['compare_at_price'],
      costPrice: json['cost_price'],
      visibility: json['visibility'],
      hasVariants: json['has_variants'],
      variantsCount: json['variants_count'],
      variantOptions: json['variant_options'] ?? [],
      inventory: json['inventory'],
      trackInventory: json['track_inventory'],
      youSaveAmount: json['you_save_amount'],
      meta: json['meta'] != null ? MetaIn.fromJson(json['meta']) : null,
      advancedOptions: json['advanced_options'] != null
          ? AdvancedOptions.fromJson(json['advanced_options'])
          : null,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      hasRelatedProducts: json['has_related_products'],
      relatedProducts: json['related_products'] ?? [],
      images: List<Images>.from(
        json["images"].map((i) => Images.fromJson(i)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['public_url'] = publicUrl;
    data['thumbnail'] = thumbnail;
    data['description'] = description;
    data['price'] = price;
    data['compare_at_price'] = compareAtPrice;
    data['cost_price'] = costPrice;
    data['visibility'] = visibility;
    data['has_variants'] = hasVariants;
    data['variants_count'] = variantsCount;
    data['variant_options'] = variantOptions.map((v) => v).toList();
    data['inventory'] = this.inventory;
    data['track_inventory'] = this.trackInventory;
    data['you_save_amount'] = this.youSaveAmount;
    if (this.meta != null) {
      data['meta'] = this.meta;
    }
    if (this.advancedOptions != null) {
      data['advanced_options'] = this.advancedOptions;
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['has_related_products'] = this.hasRelatedProducts;
    if (this.relatedProducts != null) {
      data['related_products'] = this.relatedProducts?.map((v) => v).toList();
    }
    if (this.images != null) {
      data['images'] = this.images?.map((v) => v).toList();
    }
    return data;
  }
}

class MetaIn {
  String title;
  String description;
  List<dynamic> images;

  MetaIn(
      {required this.title, required this.description, required this.images});

  static MetaIn fromJson(Map<String, dynamic> json) {
    return MetaIn(
      title: json['title'],
      description: json['description'],
      images: json['images'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.images != null) {
      data['images'] = this.images?.map((v) => v).toList();
    }
    return data;
  }
}

class AdvancedOptions {
  bool? enabled;
  bool? enableReviews;
  bool? skipToCheckout;
  bool? stickyOnMobile;
  bool? stickyOnDesktop;
  bool? readMore;
  bool? enableFacebookShare;
  bool? enableTwitterShare;
  bool? enableWhatssapShare;
  bool? enableProductQuantitySelector;
  bool? relatedProductsSection;
  bool? directAddToCart;
  String? cartText;
  List<Sections?>?sections;
  Visitors? visitors;
  Visitors? fakeStock;
  Time? time;
  Style? style;


  AdvancedOptions(
      { this.enabled,
       this.enableReviews,
       this.skipToCheckout,
       this.stickyOnMobile,
       this.stickyOnDesktop,
       this.readMore,
       this.enableFacebookShare,
       this.enableTwitterShare,
       this.enableWhatssapShare,
       this.enableProductQuantitySelector,
       this.relatedProductsSection,
       this.directAddToCart,
       this.cartText,
      this.sections,
      this.visitors,
      this.fakeStock,
      this.time,
      this.style,
     });

  static AdvancedOptions fromJson(Map<String, dynamic> json) {
    return AdvancedOptions(
      enabled: json['enabled'],
      enableReviews: json['enable_reviews'],
      skipToCheckout: json['skip_to_checkout'],
      stickyOnMobile: json['sticky_on_mobile'],
      stickyOnDesktop: json['sticky_on_desktop'],
      readMore: json['read_more'],
      enableFacebookShare: json['enable_facebook_share'],
      enableTwitterShare: json['enable_twitter_share'],
      enableWhatssapShare: json['enable_whatssap_share'],
      enableProductQuantitySelector: json['enable_product_quantity_selector'],
      relatedProductsSection: json['related_products_section'],
      directAddToCart: json['direct_add_to_cart'],
      cartText: json['cart_text'],
      sections: json['sections'] != null? List<Sections>.from(
          json["sections"].map((i) => Sections.fromJson(i))):null,
      visitors:
          json['visitors'] != null ? Visitors.fromJson(json['visitors']) : null,
      fakeStock: json['fakeStock'] != null
          ? Visitors.fromJson(json['fakeStock'])
          : null,
      time: json['time'] != null ? Time.fromJson(json['time']) : null,
      style: json['style'] != null ? Style.fromJson(json['style']) : null,

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enabled'] = this.enabled;
    data['enable_reviews'] = this.enableReviews;
    data['skip_to_checkout'] = this.skipToCheckout;
    data['sticky_on_mobile'] = this.stickyOnMobile;
    data['sticky_on_desktop'] = this.stickyOnDesktop;
    data['read_more'] = this.readMore;
    data['enable_facebook_share'] = this.enableFacebookShare;
    data['enable_twitter_share'] = this.enableTwitterShare;
    data['enable_whatssap_share'] = this.enableWhatssapShare;
    data['enable_product_quantity_selector'] =
        this.enableProductQuantitySelector;
    data['related_products_section'] = this.relatedProductsSection;
    data['direct_add_to_cart'] = this.directAddToCart;
    data['cart_text'] = this.cartText;
    if (this.sections != null) {
      data['sections'] = this.sections?.map((v) => v).toList();
    }
    if (this.visitors != null) {
      data['visitors'] = this.visitors;
    }
    if (this.fakeStock != null) {
      data['fakeStock'] = this.fakeStock?.toJson();
    }
    if (this.time != null) {
      data['time'] = this.time?.toJson();
    }
    if (this.style != null) {
      data['style'] = this.style?.toJson();
    }

    return data;
  }
}

class Sections {
  String key;
  bool show;

  Sections({required this.key, required this.show});
  static Sections fromJson(Map<String, dynamic> json) {
    return Sections(
      key: json['key'],
      show: json['show'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['show'] = this.show;
    return data;
  }
}

class Visitors {
  int max;
  int min;

  Visitors({required this.max, required this.min});
  static Visitors fromJson(Map<String, dynamic> json) {
    return Visitors(
      max: json['max'],
      min: json['min'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max'] = this.max;
    data['min'] = this.min;
    return data;
  }
}

class Time {
  int days;
  int hours;
  int minutes;
  int seconds;

  Time(
      {required this.days,
      required this.hours,
      required this.minutes,
      required this.seconds});
  static Time fromJson(Map<String, dynamic> json) {
    return Time(
      days: json['days'],
      hours: json['hours'],
      minutes: json['minutes'],
      seconds: json['seconds'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['days'] = this.days;
    data['hours'] = this.hours;
    data['minutes'] = this.minutes;
    data['seconds'] = this.seconds;
    return data;
  }
}

class Style {
  Padding? padding;
  Background? background;
  Background? text;
  Background? link;
  Background? title;
  Price? price;
  AddToCart? addToCart;
  AddToCart? quantityButtons;
  Background? primary;
  Background? secondary;
  Option? option;

  Style(
      {this.padding,
      this.background,
      this.text,
      this.link,
      this.title,
      this.price,
      this.addToCart,
      this.quantityButtons,
      this.primary,
      this.secondary,
      this.option});

  static Style fromJson(Map<String, dynamic> json) {
    return Style(
      padding:
          json['padding'] != null ? Padding.fromJson(json['padding']) : null,
      background: json['background'] != null
          ? Background.fromJson(json['background'])
          : null,
      text: json['text'] != null ? Background.fromJson(json['text']) : null,
      link: json['link'] != null ? Background.fromJson(json['link']) : null,
      title: json['title'] != null ? Background.fromJson(json['title']) : null,
      price: json['price'] != null ? Price.fromJson(json['price']) : null,
      addToCart: json['addToCart'] != null
          ? AddToCart.fromJson(json['addToCart'])
          : null,
      quantityButtons: json['quantityButtons'] != null
          ? AddToCart.fromJson(json['quantityButtons'])
          : null,
      primary:
          json['primary'] != null ? Background.fromJson(json['primary']) : null,
      secondary: json['secondary'] != null
          ? Background.fromJson(json['secondary'])
          : null,
      option: json['option'] != null ? Option.fromJson(json['option']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.padding != null) {
      data['padding'] = this.padding;
    }
    if (this.background != null) {
      data['background'] = background?.toJson();
    }
    if (this.text != null) {
      data['text'] = text;
    }
    if (this.link != null) {
      data['link'] = this.link;
    }
    if (this.title != null) {
      data['title'] = this.title;
    }
    if (this.price != null) {
      data['price'] = this.price;
    }
    if (this.addToCart != null) {
      data['addToCart'] = this.addToCart;
    }
    if (this.quantityButtons != null) {
      data['quantityButtons'] = this.quantityButtons;
    }
    if (this.primary != null) {
      data['primary'] = this.primary;
    }
    if (this.secondary != null) {
      data['secondary'] = this.secondary;
    }
    if (this.option != null) {
      data['option'] = this.option;
    }
    return data;
  }
}

class Padding {
  int top;
  int bottom;

  Padding({required this.top, required this.bottom});
  static Padding fromJson(Map<String, dynamic> json) {
    return Padding(
      top: json['top'],
      bottom: json['bottom'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['top'] = this.top;
    data['bottom'] = this.bottom;
    return data;
  }
}

class Background {
  String color;

  Background({required this.color});
  static Background fromJson(Map<String, dynamic> json) {
    return Background(
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    return data;
  }
}

class Price {
  Background? before;
  Background? after;

  Price({this.before, this.after});
  static Price fromJson(Map<String, dynamic> json) {
    return Price(
      before:
          json['before'] != null ? Background.fromJson(json['before']) : null,
      after: json['after'] != null ? Background.fromJson(json['after']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.before != null) {
      data['before'] = before;
    }
    if (this.after != null) {
      data['after'] = after;
    }
    return data;
  }
}

class AddToCart {
  Background? text;
  Background? background;
  Background? border;
  Hover? hover;

  AddToCart({this.text, this.background, this.border, this.hover});
  static AddToCart fromJson(Map<String, dynamic> json) {
    return AddToCart(
      text: json['text'] != null ? Background.fromJson(json['text']) : null,
      background: json['background'] != null
          ? Background.fromJson(json['background'])
          : null,
      border:
          json['border'] != null ? Background.fromJson(json['border']) : null,
      hover: json['hover'] != null ? Hover.fromJson(json['hover']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.text != null) {
      data['text'] = this.text;
    }
    if (this.background != null) {
      data['background'] = this.background;
    }
    if (this.border != null) {
      data['border'] = this.border;
    }
    if (this.hover != null) {
      data['hover'] = this.hover;
    }
    return data;
  }
}

class Hover {
  Background? text;
  Background? background;
  Background? border;

  Hover({this.text, this.background, this.border});
  static Hover fromJson(Map<String, dynamic> json) {
    return Hover(
      text: json['text'] != null ? Background.fromJson(json['text']) : null,
      background: json['background'] != null
          ? Background.fromJson(json['background'])
          : null,
      border:
          json['border'] != null ? Background.fromJson(json['border']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.text != null) {
      data['text'] = this.text;
    }
    if (this.background != null) {
      data['background'] = this.background;
    }
    if (this.border != null) {
      data['border'] = this.border;
    }
    return data;
  }
}

class Option {
  Background? border;

  Option({this.border});
  static Option fromJson(Map<String, dynamic> json) {
    return Option(
        border: json['border'] != null
            ? Background.fromJson(json['border'])
            : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.border != null) {
      data['border'] = this.border;
    }
    return data;
  }
}

class Images {
  String id;
  String name;
  int type;
  String url;
  int order;
  VariationsImage? variations;

  Images(
      {required this.id,
      required this.name,
      required this.type,
      required this.url,
      required this.order,
      this.variations});
  static Images fromJson(Map<String, dynamic> json) {
    return Images(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      url: json['url'],
      order: json['order'],
      variations: json['variations'] != null
          ? VariationsImage.fromJson(json['variations'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['url'] = this.url;
    data['order'] = this.order;
    if (this.variations != null) {
      data['variations'] = this.variations;
    }
    return data;
  }
}

class VariationsImage {
  String original;
  String sm;
  String md;
  String lg;

  VariationsImage(
      {required this.original,
      required this.sm,
      required this.md,
      required this.lg});

  static VariationsImage fromJson(Map<String, dynamic> json) {
    return VariationsImage(
      original: json['original'],
      sm: json['sm'],
      md: json['md'],
      lg: json['lg'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original'] = this.original;
    data['sm'] = this.sm;
    data['md'] = this.md;
    data['lg'] = this.lg;
    return data;
  }
}

class Meta {
  Pagination? pagination;

  Meta({this.pagination});
  static Meta fromJson(Map<String, dynamic> json) {
    return Meta(
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination;
    }
    return data;
  }
}

class Pagination {
  int total;
  int count;
  int perPage;
  int currentPage;
  int totalPages;
  dynamic links;

  Pagination(
      {required this.total,
      required this.count,
      required this.perPage,
      required this.currentPage,
      required this.totalPages,
      this.links});
  static Pagination fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json['total'],
      count: json['count'],
      perPage: json['per_page'],
      currentPage: json['current_page'],
      totalPages: json['total_pages'],
      links: json['links']=={}?LinksIn.fromJson(json['links']):[]
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    if (this.links != null) {
      data['links'] = this.links;
    }
    return data;
  }
}

class LinksIn {
  String next;

  LinksIn({required this.next});
  static LinksIn fromJson(Map<String, dynamic> json) {
    return LinksIn(
      next: json['next'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next'] = this.next;
    return data;
  }
}
