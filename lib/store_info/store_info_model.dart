class StoreInfo {
  String? slug;
  String name;
  bool isStaff;
  String email;
  num dueAmount;
  num balance;
  num unpaidInvoicesAmount;
  String storeId;
  Currency? currency;
  String domain;
  num status;
  String statusText;
  String? closedAt;
  String packId;
  String logo;
  String? firstName;
  String lastName;
  String fullName;
  String phone;
  String? bio;
  String? website;
  Notices? notices;
  bool isActive;
  bool isEmailVerified;

  StoreInfo(
      { this.slug,
        required this.name,
        required this.isStaff,
        required this.email,
        required this.dueAmount,
        required this.balance,
        required this.unpaidInvoicesAmount,
        required this.storeId,
        required this.currency,
        required this.domain,
        required this.status,
        required this.statusText,
        this.closedAt,
        required this.packId,
        required this.logo,
         this.firstName,
        required this.lastName,
        required this.fullName,
        required this.phone,
         this.bio,
         this.website,
        required this.notices,
        required this.isActive,
        required this.isEmailVerified});
  static StoreInfo fromJson(Map<String, dynamic> json) {
    return StoreInfo(
        slug : json['slug'],
        name : json['name'],
        isStaff : json['is_staff'],
    email : json['email'],
    dueAmount : json['due_amount'],
    balance : json['balance'],
    unpaidInvoicesAmount : json['unpaid_invoices_amount'],
    storeId : json['store_id'],
    currency : json['currency'] != null
    ?  Currency.fromJson(json['currency'])
        : null,
    domain : json['domain'],
    status : json['status'],
    statusText : json['status_text'],
    closedAt : json['closed_at'],
    packId : json['pack_id'],
    logo : json['logo'],
    firstName : json['first_name'],
    lastName : json['last_name'],
    fullName : json['full_name'],
    phone : json['phone'],
    bio : json['bio'],
    website : json['website'],
    notices :
    json['notices'] != null ?  Notices.fromJson(json['notices']) : null,
    isActive : json['is_active'],
    isEmailVerified : json['is_email_verified'],
    );}


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slug'] = slug;
    data['name'] = name;
    data['is_staff'] = isStaff;
    data['email'] = email;
    data['due_amount'] = dueAmount;
    data['balance'] = balance;
    data['unpaid_invoices_amount'] = unpaidInvoicesAmount;
    data['store_id'] = storeId;
    if (currency != null) {
      data['currency'] = currency?.toJson();
    }
    data['domain'] = domain;
    data['status'] = status;
    data['status_text'] = statusText;
    data['closed_at'] = closedAt;
    data['pack_id'] = packId;
    data['logo'] = logo;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['full_name'] = fullName;
    data['phone'] = phone;
    data['bio'] = bio;
    data['website'] = website;
    if (notices != null) {
      data['notices'] = notices?.toJson();
    }
    data['is_active'] = isActive;
    data['is_email_verified'] = isEmailVerified;
    return data;
  }
}

class Currency {
  String code;
  String symbol;

  Currency({required this.code, required this.symbol});
  static Currency fromJson(Map<String, dynamic> json) {
    return Currency(
        code : json['code'],
        symbol : json['symbol'],
    );}


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['symbol'] = symbol;
    return data;
  }
}

class Notices {
  String generalNotice;

  Notices({required this.generalNotice});
  static Notices fromJson(Map<String, dynamic> json) {
    return Notices(
        generalNotice : json['general_notice'],
    );}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['general_notice'] = generalNotice;
    return data;
  }
}