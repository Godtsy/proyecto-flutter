class ApiCollection<T> {
  final int code;
  final String lang;
  final String message;
  final List<T> data;

  ApiCollection({
    required this.code,
    required this.data,
    required this.lang,
    required this.message,
  });

  factory ApiCollection.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonData,
  ) {
    return ApiCollection(
      code: json['code'],
      data: (json['data'] as List<dynamic>)
          .map((data) => fromJsonData(data))
          .toList(),
      lang: json['lang'],
      message: json['message'],
    );
  }
}
