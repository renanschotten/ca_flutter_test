import 'package:ca_flutter_test/features/blog/interactor/services/i_api_service.dart';
import 'package:http/http.dart' as http;

class HttpApiService implements IApiService {
  @override
  Future<ApiResponse> get(ApiRequest request) async {
    final response = await http.get(
      Uri.parse(request.url),
      headers: request.headers,
    );

    return ApiResponse(code: response.statusCode, body: response.body);
  }
}
