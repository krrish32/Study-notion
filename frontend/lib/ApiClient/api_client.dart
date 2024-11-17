import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/logger.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  late String baseUrl;
  String? _authToken;

  // Private constructor
  ApiClient._internal();

  // Singleton factory
  factory ApiClient() => _instance;

  // Initialize the API client with base URL and optional token
  void initialize(String baseUrl, {String? token}) {
    this.baseUrl = baseUrl;
    _authToken = token;
  }

  // Set or update the authorization token
  void setAuthToken(String token) {
    printLog("Login Token successfully added");
    _authToken = token;
  }

  // POST request
  Future<dynamic> post(String endpoint,dynamic body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    _logRequest('POST', url.toString(), body);
    try {
      final response = await http.post(
        url,
        headers: _buildHeaders(),
        body: jsonEncode(body),
      );
      _logResponse('POST', url.toString(), response);
      return _handleResponse(response);
    } catch (e) {
      _logError('POST', url.toString(), e);
      throw Exception('Error occurred: $e');
    }
  }

  // GET request
  Future<dynamic> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    _logRequest('GET', url.toString());
    try {
      final response = await http.get(
        url,
        headers: _buildHeaders(),
      );
      _logResponse('GET', url.toString(), response);
      return _handleResponse(response);
    } catch (e) {
      _logError('GET', url.toString(), e);
      throw Exception('Error occurred: $e');
    }
  }

  // PUT request
  Future<dynamic> put(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    _logRequest('PUT', url.toString(), body);
    try {
      final response = await http.put(
        url,
        headers: _buildHeaders(),
        body: jsonEncode(body),
      );
      _logResponse('PUT', url.toString(), response);
      return _handleResponse(response);
    } catch (e) {
      _logError('PUT', url.toString(), e);
      throw Exception('Error occurred: $e');
    }
  }

  // DELETE request
  Future<dynamic> delete(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    _logRequest('DELETE', url.toString());
    try {
      final response = await http.delete(
        url,
        headers: _buildHeaders(),
      );
      _logResponse('DELETE', url.toString(), response);
      return _handleResponse(response);
    } catch (e) {
      _logError('DELETE', url.toString(), e);
      throw Exception('Error occurred: $e');
    }
  }

  // Build headers dynamically
  Map<String, String> _buildHeaders() {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    if (_authToken != null) {
      headers['Authorization'] = 'Bearer $_authToken';
    }

    return headers;
  }

  // Handle HTTP response
  dynamic _handleResponse(http.Response response) {
    final responseBody = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseBody;
    } else {
      throw Exception(
          'Error: ${response.statusCode}, Message: ${responseBody['message'] ?? 'Unknown error'}');
    }
  }

  // Logger functions
  void _logRequest(String method, String url, [dynamic body]) {
    printLog('[$method] Request to: $url');
    if (body != null) {
      printLog('Request Body: ${jsonEncode(body)}');
    }
  }

  void _logResponse(String method, String url, http.Response response) {
    printLog('[$method] Response from: $url');
    printLog('Status Code: ${response.statusCode}');
    printLog('Response Body: ${response.body}');
  }

  void _logError(String method, String url, dynamic error) {
    printLog('[$method] Error on request to: $url');
    printLog('Error Details: $error');
  }
}
