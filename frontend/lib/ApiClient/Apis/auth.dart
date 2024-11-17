import 'package:edtec/ApiClient/Models/RequestModel/LoginRequestModel.dart';
import 'package:edtec/ApiClient/Models/ResponseModel/login_response_model.dart';
import 'package:edtec/ApiClient/endpoints.dart';
import 'package:edtec/utils/logger.dart';

import '../api_client.dart';

class AuthRepository{

  final ApiClient _apiClient = ApiClient();

  //Login Api

  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    try {
      var response = await _apiClient.post(ApiEndpoints.login, loginRequestModel);
      // Update the token after successful login
      _apiClient.setAuthToken(response["token"]);
      printLog('Login successful');
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      printLog('Error in login: ${e}');
      throw Exception('Login failed: $e');
    }
  }


}