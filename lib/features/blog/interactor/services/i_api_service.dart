import 'package:equatable/equatable.dart';

abstract interface class IApiService {
  Future<ApiResponse> get(ApiRequest request);
}

class ApiResponse extends Equatable {
  final int code;
  final String body;

  const ApiResponse({required this.code, required this.body});

  @override
  List<Object?> get props => [code, body];
}

class ApiRequest extends Equatable {
  final String url;
  final Map<String, String>? headers;

  const ApiRequest({
    required this.url,
    this.headers,
  });

  @override
  List<Object?> get props => [url, headers];
}
