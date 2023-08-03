class User {
   String? password;
  final String email;

  User( {
     this.password,
    required this.email,
  });

}

class LoginResponse{

  final String token;
  final bool isStaff;
  late final List<StoresModel> stores;

  LoginResponse({
    required this.token,
  required this.isStaff,
  required this.stores});

  static LoginResponse fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json["token"],
      isStaff: json["is_staff"],
      stores: List<StoresModel>.from(
        json["stores"].map((i) => StoresModel.fromJson(i)),
      ),

    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    data['is_staff'] = isStaff;
    if (stores != null) {
      data['stores'] = stores.map((v) => v.toJson()).toList();
    }

    return data;
  }


}

class StoresModel{

  final String id;
  final String slug;


  StoresModel({
    required this.id,
  required this.slug,
 });

  static StoresModel fromJson(Map<String, dynamic> json) {
    return StoresModel(
      id: json["store_id"],
      slug: json["slug"],


    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = id;
    data['slug'] = slug;

    return data;
  }



}
