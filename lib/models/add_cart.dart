class AddCart {
  bool? status;
  String? message;

  AddCart({
    this.status,
    this.message,
  });

  AddCart.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
