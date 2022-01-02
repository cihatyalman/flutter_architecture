class Response {
  bool? hasError;
  String? message;
  dynamic data;

  Response({
    this.hasError,
    this.message,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'hasError': hasError,
      'message': message,
      'data': data,
    };
  }

  factory Response.fromMap(Map<String, dynamic> map) {
    return Response(
      hasError: map['hasError'],
      message: map['message'],
      data: map['data'],
    );
  }
}
