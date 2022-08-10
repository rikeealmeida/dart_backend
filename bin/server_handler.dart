import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServeHandler {
  Handler get handler {
    final router = Router();

    //metodos get
    router.get('/', (Request request) {
      return Response(200, body: 'Primeira rota!');
    });
    // http://localhost:8080/ola/mundo
    // ola mundo
    router.get('/ola/mundo/<usuario>', (Request request, String usuario) {
      return Response.ok('Ola mundo $usuario');
    });
    //http://localhost:8080/query?nome=Henrique
    router.get('/query', (Request req) {
      String? nome = req.url.queryParameters['nome'];
      String? idade = req.url.queryParameters['idade'];
      return Response.ok('Query eh: $nome, idade $idade');
    });

    //metodos post
    router.post('/login', (Request req) async {
      var result = await req.readAsString();
      Map json = jsonDecode(result);
      var usuario = json['user'];
      var password = json['password'];

      if (usuario == 'rikeealmeida' && password == 123) {
        return Response.ok('Bem vindo, $usuario!');
      } else {
        return Response.forbidden('Acesso negado!');
      }
    });

    return router;
  }
}
