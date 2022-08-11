import 'package:shelf/shelf.dart';

import 'apis/news_api.dart';
import 'apis/login_api.dart';
import 'infra/custom_server.dart';
import 'infra/middleware_interception.dart';
import 'infra/security/security_service_imp.dart';
import 'services/news_service.dart';
import 'utils/custom_env.dart';

void main(List<String> args) async {
  //comentar para desativar o .env de desenvolvimento
  CustomEnv.fromFile('.env-dev');

  var cascadeHandler = Cascade()
      .add(LoginApi(SecurityServiceImp()).handler)
      .add(NewsApi(NewsService()).handler)
      .handler;

  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().middleware)
      .addHandler(cascadeHandler);

  CustomServer().initialize(
    handler: handler,
    address: await CustomEnv.get<String>(key: 'server_address'),
    port: await CustomEnv.get<int>(key: 'server_port'),
  );
}
