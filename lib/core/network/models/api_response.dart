class ApiResponse<T> {
  final int code;
  final String lang;
  final String message;
  final T data;

  ApiResponse({
    required this.code,
    required this.data,
    required this.lang,
    required this.message,
  });
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonData,
  ) {
    return ApiResponse(
      code: json['code'],
      data: fromJsonData(json['data']),
      lang: json['lang'],
      message: json['message'],
    );
  }
}
