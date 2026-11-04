class ApiBadResponse {
  final String field;
  final String error;

  ApiBadResponse({required this.field, required this.error});
  factory ApiBadResponse.fromJson(Map<String, dynamic> json) {
    return ApiBadResponse(field: json['field'], error: json['error']);
  }
}
