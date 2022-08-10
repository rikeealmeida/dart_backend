import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'server_handler.dart';

void main() async {
  var _server = ServeHandler();

  String address = 'localhost';
  int port = 8080;

  final server = await shelf_io.serve(_server.handler, address, port);

  print('Servidor rodando no endereço: http://${address}:${port}');
}
