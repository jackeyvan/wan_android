class ApiResponse {
  final String? msg;
  final int? code;
  final dynamic data;

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      msg: json['msg'],
      data: json['data'],
    );
  }

  ApiResponse({this.msg, this.code, this.data});

  Map<String, dynamic> toJson() {
    return {
      'msg': msg,
      'code': code,
      'data': data,
    };
  }
}
