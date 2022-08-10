import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/news_model.dart';
import '../services/generic_service.dart';
import '../services/news_service.dart';

class NewsApi {
  final GenericService<NewsModel> _service;

  NewsApi(this._service);

  Handler get handler {
    Router router = Router();

    //listagem
    router.get('/blog/news', (Request req) {
      List<NewsModel> news = _service.findAll();
      List<Map?> newsMap = news.map((e) => e.toJson()).toList();

      return Response.ok(jsonEncode(newsMap), headers: {'content-type':'application/json'});
    });

    //nova postagem
    router.post('/blog/news', (Request req) async {
      var body = await req.readAsString();

      _service.save(NewsModel.fromJson(jsonDecode(body)));
      return Response(201);
    });

    //atualizar noticia através do queryParams
    // /blog/news?id=1 //update
    router.put('/blog/news', (Request req) {
      // _service.save('value');
      String? id = req.url.queryParameters['id'];

      return Response.ok('Choveu hoje!!');
    });

    //excluir noticia através do queryParams
    // /blog/news?id=1  //delete
    router.delete('/blog/news', (Request req) {
      // _service.delete(1);
      String? id = req.url.queryParameters['id'];

      return Response.ok('Choveu hoje!!');
    });

    return router;
  }
}
