// ignore_for_file: invalid_annotation_target

class ApiResponse<T> {
  final T? data;
  final String? message;
  final int? code;
  final bool? result;

  ApiResponse({
    required this.data,
    required this.message,
    required this.code,
    required this.result,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return ApiResponse<T>(
        data: json['data'] != null ? fromJsonT(json['data']) : null,
        message: json['message'] is String
            ? json['message']
            : json['message'] is List<String>
                ? (json['message'] as List<String>).reduce(
                    (value, element) => '$value,$element',
                  )
                : null,
        code: json['code'] as int?,
        result: json['result'] as bool?);
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return {
      'data': data != null ? toJsonT(data as T) : null,
      'message': message,
      'code': code,
    };
  }
}
