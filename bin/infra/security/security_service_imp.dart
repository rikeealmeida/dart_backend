import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import 'security_service.dart';

class SecurityServiceImp implements SecurityService<JWT> {
  @override
  Future<String> generateJWT(String userID) {
    var jwt = JWT(payload);
  }

  @override
  validateJWT(String token) {
    // TODO: implement validateJWT
    throw UnimplementedError();
  }
}
