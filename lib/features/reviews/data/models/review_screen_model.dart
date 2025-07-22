class ReviewResponseModel {
  final int? code;
  final String? status;
  final String? msg;

  ReviewResponseModel({
    this.code,
    this.status,
    this.msg,
  });

  factory ReviewResponseModel.fromJson(Map<String, dynamic> json) {
    return ReviewResponseModel(
      code: json['code'],
      status: json['status'],
      msg: json['msg'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'status': status,
      'msg': msg,
    };
  }
}
