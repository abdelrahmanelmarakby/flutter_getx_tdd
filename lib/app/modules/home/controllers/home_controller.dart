import 'package:flutter_getx_tdd/app/data/models/articles_model.dart';
import 'package:flutter_getx_tdd/app/data/services/news_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final NewsService _newsService;
  HomeController(this._newsService);
  List<Article> _articles = [];
  List<Article> get articles => _articles;
  bool _isLoading = false;
  bool get getIsLoading => _isLoading;

  Future<void> getArticles() async {
    _isLoading = true;
    update();
    _articles = await _newsService.getArticles();
    _isLoading = false;
    update();
  }
}
